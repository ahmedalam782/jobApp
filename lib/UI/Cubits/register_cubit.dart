import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_bsque/Shared/network/local/cache_helper.dart';

import '../../Model/register_model.dart';
import '../../Shared/Constant/constant.dart';
import '../../Shared/Exceptions/server_exceptions.dart';
import '../../Shared/Style/Color/color.dart';
import '../../Shared/Style/Image/image_assets.dart';
import '../../Shared/network/remote/API/api_consumer.dart';
import '../States/register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  APIConsumer apiConsumer;

  RegisterCubit({required this.apiConsumer}) : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  var registerFormKey = GlobalKey<FormState>();

  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool isValid = false;

  String suffixImage = AppImageAssets.eyeSlashImage;
  Color textPassword = AppColor.hintTextForm;

  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixImage = isPassword
        ? AppImageAssets.eyeSlashImage
        : AppImageAssets.eyeColoredImage;
    emit(RegisterPasswordVisibilityState());
  }

  String? validAllForm(String? value, String result) {
    if (value!.isEmpty) {
      emit(RegisterValidAllFormState());
      return '$result must not be empty';
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    emit(RegisterValidateEmailState());
    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : validAllForm(value, 'Email address');
  }

  String? validatePassword(String? value) {
    if (value!.length >= 8) {
      textPassword = AppColor.textFormCorrectColor;
    } else {
      textPassword = AppColor.textFormWrongColor;
    }
    emit(RegisterValidatePasswordState());
    return null;
  }

  void onSubmitForm(String value) {
    if (registerFormKey.currentState!.validate()) {
      emit(RegisterOnFieldSubmittedState());
      isValid = true;
    } else {
      isValid = false;
    }
  }

  RegisterModel? registerModel;

  Future createAccount() async {
    if (registerFormKey.currentState!.validate()) {
      emit(RegisterSignUpState());
      isValid = true;
      ConstantData.isLogin = false;
      try {
        emit(RegisterLoadingState());
        final response = await apiConsumer.postData(
          APIConstantData.register,
          data: {
            APIConstantData.name: usernameTextEditingController.text,
            APIConstantData.email: emailTextEditingController.text,
            APIConstantData.password: passwordTextEditingController.text,
          },
        );
        emit(RegisterSuccessState());
        registerModel = RegisterModel.fromJson(response);
        final userId = registerModel!.data[APIConstantData.id];
        final token = registerModel!.token;
        CacheHelper.saveData(key: APIConstantData.token, value: token);
        CacheHelper.saveData(key: APIConstantData.id, value: userId);
      } on ServerExceptions catch (error) {
        emit(RegisterErrorState(error.errorServerModel.error!['email'][0]));
      }
    } else {
      isValid = false;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/login_model.dart';
import '../../Shared/Constant/constant.dart';
import '../../Shared/Exceptions/server_exceptions.dart';
import '../../Shared/Style/Color/color.dart';
import '../../Shared/Style/Image/image_assets.dart';
import '../../Shared/network/local/cache_helper.dart';
import '../../Shared/network/remote/API/api_consumer.dart';
import '../States/login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  APIConsumer apiConsumer;

  LoginCubit({required this.apiConsumer}) : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  var loginFormKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool isValid = false;

  String suffixImage = AppImageAssets.eyeSlashImage;
  Color fillColorCheckbox = AppColor.textButtonColorClicked;
  bool isPassword = true;
  bool isChecked = false;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixImage = isPassword
        ? AppImageAssets.eyeSlashImage
        : AppImageAssets.eyeColoredImage;
    emit(LoginPasswordVisibilityState());
  }

  void checkRememberMe() {
    isChecked = !isChecked;
    fillColorCheckbox =
        isChecked ? AppColor.primaryColor : AppColor.textButtonColorClicked;
    emit(LoginRememberMeState());
  }

  String? validAllForm(String? value, String result) {
    if (value!.isEmpty) {
      emit(LoginValidAllFormState());
      return '$result must not be empty';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value!.length < 6) {
      emit(LoginValidatePasswordState());
      return 'The password field must be at least 6 characters.';
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
    emit(LoginValidateEmailState());
    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : validAllForm(value, 'Email address');
  }

  void onSubmitForm(String value) {
    if (loginFormKey.currentState!.validate()) {
      emit(LoginOnFieldSubmittedState());
      isValid = true;
    } else {
      isValid = false;
    }
  }

  LoginModel? loginModel;

  Future signIn() async {
    if (loginFormKey.currentState!.validate()) {
      emit(LoginSignInState());
      isValid = true;
      ConstantData.isLogin = true;
      try {
        emit(LoginLoadingState());
        final response = await apiConsumer.postData(
          APIConstantData.login,
          data: {
            APIConstantData.email: emailTextEditingController.text,
            APIConstantData.password: passwordTextEditingController.text,
          },
        );
        emit(LoginSuccessState());
        loginModel = LoginModel.fromJson(response);
        final userId = loginModel!.user[APIConstantData.id];
        final token = loginModel!.token;
        CacheHelper.saveData(key: APIConstantData.token, value: token);
        CacheHelper.saveData(key: APIConstantData.id, value: userId);
        CacheHelper.saveData(
            key: APIConstantData.password,
            value: passwordTextEditingController.text);
        ConstantData.rememberMe = "true";
        CacheHelper.saveData(
            key: ConstantData.isRememberMe,
            value: isChecked ? ConstantData.rememberMe : null);
      } on ServerExceptions catch (error) {
        emit(LoginErrorState(error.errorServerModel.errorMessage!));
      }
    } else {
      isValid = false;
    }
  }
}

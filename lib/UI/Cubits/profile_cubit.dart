import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:j_bsque/Shared/Exceptions/server_exceptions.dart';
import 'package:j_bsque/Shared/network/local/cache_helper.dart';
import 'package:j_bsque/Shared/network/remote/API/api_consumer.dart';

import '../../Model/get_portfolio_model.dart';
import '../../Shared/Constant/constant.dart';
import '../../Shared/network/remote/function/upload_image_to_api.dart';
import '../States/profile_state.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit({required this.api}) : super(ProfileInitialState());
  final APIConsumer api;

  static ProfileCubit get(context) => BlocProvider.of(context);
  XFile? profilePic;
  TextEditingController name = ConstantData.editProfileDataModel[0].controller;
  TextEditingController bio = ConstantData.editProfileDataModel[1].controller;
  TextEditingController address =
      ConstantData.editProfileDataModel[2].controller;
  TextEditingController telephone = TextEditingController();
  final password = CacheHelper.getData(key: APIConstantData.password);
  var editProfileFormKey = GlobalKey<FormState>();

  String? validAllForm(String? value, String result) {
    if (value!.isEmpty) {
      emit(ProfileValidAllFormState());
      return '$result must not be empty';
    } else {
      return null;
    }
  }

  void onSubmitForm(String value) {
    if (editProfileFormKey.currentState!.validate()) {
      emit(ProfileOnFieldSubmittedState());
    }
  }

  // uploadProfilePicture and show in screen
  uploadProfilePicture(XFile image) {
    profilePic = image;
    profilePicture = null;
    print(profilePic!.path);
    emit(ProfileUploadProfilePictureState());
  }

  Future updateProfileData() async {
    if (editProfileFormKey.currentState!.validate()) {
      emit(ProfileOnFieldSubmittedState());
      try {
        if (profilePic != null) {
          emit(EditProfileLoadingState());
          await api.postData(APIConstantData.updateUser, data: {
            APIConstantData.name: name.text,
            APIConstantData.password: password,
          });
          await api
              .postData(isFormData: true, APIConstantData.addPortfolio, data: {
            APIConstantData.image: await uploadImageToAPI(profilePic!),
          });
          await api.putData(APIConstantData.editProfile, queryParameters: {
            APIConstantData.bio: bio.text,
            APIConstantData.address: address.text,
            APIConstantData.mobile: telephone.text,
          });
          CacheHelper.saveData(
              key: APIConstantData.image, value: profilePic!.path);
          emit(EditProfileSuccessState());
        }
      } on ServerExceptions catch (error) {
        emit(EditProfileErrorState(error.errorServerModel.errorMessage!));
      }
    }
  }

  GetProfileData? getProfileData;
  String? profilePicture;

  Future getEditProfile() async {
    try {
      emit(GetProfileDataLoadingState());
      final response = await api.getData(
        APIConstantData.getPortfolio,
      );
      getProfileData = GetProfileData.fromJson(response);
      name.text = ConstantData.editProfileDataModel[0].controller.text =
          getProfileData!.data['portfolio'][0]['name'];
      bio.text = ConstantData.editProfileDataModel[1].controller.text =
          getProfileData!.data['profile']['bio'];
      address.text = ConstantData.editProfileDataModel[2].controller.text =
          getProfileData!.data['profile']['address'];
      telephone.text = getProfileData!.data['profile']['mobile'];
      profilePicture = getProfileData!.data['portfolio'][0]['image'];
      profilePic = XFile(CacheHelper.getData(key: APIConstantData.image));
      emit(GetProfileDataSuccessState());
      return response;
    } on ServerExceptions catch (error) {
      emit(GetProfileDataErrorState(error.errorServerModel.errorMessage!));
    }
  }

  bool isChecked = false;
  late int currentIndex;

  Map<int, bool> isSelected = {};

  void getContentHelpAppear(int index) {
    currentIndex = index;
    isChecked = !isChecked;
    if (currentIndex == index && isChecked == true) {
      isSelected.addAll({currentIndex: isChecked});
    } else if (currentIndex == index && isChecked == false) {
      isSelected.remove(currentIndex);
    }
    emit(HelpCenterOpenContainerContent());
  }
}

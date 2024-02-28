import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:j_bsque/Model/profile_data_model.dart';
import 'package:j_bsque/Shared/Constant/constant.dart';
import 'package:j_bsque/Shared/Exceptions/server_exceptions.dart';
import 'package:j_bsque/Shared/network/remote/API/api_consumer.dart';
import 'package:j_bsque/UI/Widget/bottom_nav_screen/applied_screen.dart';
import 'package:j_bsque/UI/Widget/bottom_nav_screen/message_screen.dart';
import 'package:j_bsque/UI/Widget/bottom_nav_screen/profile_screen.dart';
import 'package:j_bsque/UI/Widget/bottom_nav_screen/saved_screen.dart';

import '../../Model/get_suggested_job.dart';
import '../States/home_state.dart';
import '../Widget/bottom_nav_screen/home_details_screen.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit({required this.api}) : super(HomeInitialState());
  APIConsumer api;

  static HomeCubit get(context) => BlocProvider.of(context);
  XFile? profilePic;
  int currentIndex = 0; // index of screen
  String? userName = '';
  String? userEmail = '';

  List<Widget> screens = [
    HomeDetailsScreen(),
    const MessagesScreen(),
    AppliedScreen(),
    const SavedScreen(),
    const ProfileScreen()
  ];
  List<Map<String, dynamic>> suggestedJob = [];
  List<String> jobType = [];

  ProfileDataModel? profileDataModel;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  } // change index of Bottom Nav

  Future getProfile() async {
    emit(HomeGetUserLoadingState());
    try {
      final response = await api.getData(
        APIConstantData.profile,
      );
      profileDataModel = ProfileDataModel.fromJson(response);
      userName = profileDataModel!.data[APIConstantData.name];
      userEmail = profileDataModel!.data[APIConstantData.email];
      emit(HomeGetUserSuccessState());
    } on ServerExceptions catch (error) {
      emit(HomeGetUserErrorState(error.errorServerModel.errorMessage!));
    }
  }

  late GetSuggestedJobModel getSuggestedJobModel;

  Future getSuggestedJob() async {
    try {
      emit(HomeGetSuggestedJobLoadingState());
      final response = await api.getData(
        APIConstantData.getSuggestedJob,
      );
      getSuggestedJobModel = GetSuggestedJobModel.fromJson(response);
      suggestedJob.add(getSuggestedJobModel.data);
      for (int i = 0; i < suggestedJob.length; i++) {
        jobType.add(suggestedJob[i][APIConstantData.jobTimeType]);
        jobType.add(suggestedJob[i][APIConstantData.jobType]);
        jobType.add(suggestedJob[i][APIConstantData.jobLevel]);
      }
      emit(HomeGetSuggestedJobSuccessState());
    } on ServerExceptions catch (error) {
      emit(HomeGetSuggestedJobErrorState(error.errorServerModel.errorMassage!));
    }
  }
}

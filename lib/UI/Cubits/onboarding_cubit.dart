import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_bsque/Shared/network/local/cache_helper.dart';

import '../../Shared/Constant/constant.dart';
import '../States/onboarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialStates());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  int currentPage = 0;

  PageController pageController = PageController();

  void onPageChanged(int index) {
    currentPage = index;
    emit(OnBoardingPageChangeStates());
  }

  void onDotNavigationClick(int index) {
    currentPage = index;
    pageController.jumpToPage(currentPage);
    emit(OnBoardingDotNavigationClickStates());
  }

  void onSkipClick() {
    currentPage = ConstantData.onboardingList.length - 1;
    pageController.jumpToPage(currentPage);
    emit(OnBoardingSkipClickStates());
  }

  void onNextPageClick() {
    if (currentPage == ConstantData.onboardingList.length - 1) {
      ConstantData.isFirstOpen = "true";
      CacheHelper.saveData(
          key: ConstantData.isFirstOpenApp, value: ConstantData.isFirstOpen);
      emit(OnBoardingLastPageClickStates());
    } else {
      currentPage++;
      pageController.jumpToPage(currentPage);
      emit(OnBoardingNextPageClickStates());
    }
  }
}

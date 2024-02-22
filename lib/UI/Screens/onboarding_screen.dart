import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/Components/button_components.dart';
import '../../Shared/Constant/constant.dart';
import '../Cubits/onboarding_cubit.dart';
import '../States/onboarding_state.dart';
import '../Widget/OnBoarding/onboarding_controller.dart';
import '../Widget/OnBoarding/onboarding_header.dart';
import '../Widget/OnBoarding/onboarding_page_view.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = 'OnboardingScreen';

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {
        if (state is OnBoardingLastPageClickStates) {
          Navigator.popAndPushNamed(context, LoginScreen.routeName);
        }
      },
      builder: (context, state) {
        OnBoardingCubit onBoardingCubit = OnBoardingCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: [
                const OnBoardingHeader(),
                const Expanded(
                  flex: 3,
                  child: OnBoardingPageView(),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const OnBoardingController(),
                      const Spacer(
                        flex: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: ButtonComponents(
                          buttonText: onBoardingCubit.currentPage ==
                                  ConstantData.onboardingList.length - 1
                              ? 'Get Started'
                              : 'Next',
                          onPressed: onBoardingCubit.onNextPageClick,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

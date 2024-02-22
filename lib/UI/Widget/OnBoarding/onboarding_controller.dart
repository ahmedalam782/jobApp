import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Shared/Constant/constant.dart';
import '../../Cubits/onboarding_cubit.dart';
import '../../States/onboarding_state.dart';

class OnBoardingController extends StatelessWidget {
  const OnBoardingController({super.key});

  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          OnBoardingCubit onBoardingCubit = OnBoardingCubit.get(context);
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                effect: const WormEffect(
                    activeDotColor: Color(0xff3366FF),
                    dotHeight: 8,
                    dotWidth: 8),
                controller: onBoardingCubit.pageController,
                count: ConstantData.onboardingList.length,
                onDotClicked: onBoardingCubit.onDotNavigationClick,
              ),
            ],
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Shared/Components/text_span_components.dart';
import '../../../Shared/Constant/constant.dart';
import '../../Cubits/onboarding_cubit.dart';
import '../../States/onboarding_state.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        OnBoardingCubit onBoardingCubit = OnBoardingCubit.get(context);
        return PageView.builder(
          controller: onBoardingCubit.pageController,
          onPageChanged: onBoardingCubit.onPageChanged,
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                ConstantData.onboardingList[index].image,
                height: MediaQuery.of(context).size.width * .58,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextSpanComponents(
                  textOne: ConstantData.onboardingList[index].body,
                  styleTextOne: Theme.of(context).textTheme.headlineLarge,
                  textColored: ConstantData.onboardingList[index].bodyBlue,
                  styleTextColored:
                      Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                  textThree: ConstantData.onboardingList[index].bodyNotBlue,
                  styleTextThree: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  ConstantData.onboardingList[index].subBody,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
          itemCount: ConstantData.onboardingList.length,
        );
      },
    );
  }
}

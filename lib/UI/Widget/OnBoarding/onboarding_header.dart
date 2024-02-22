import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Cubits/onboarding_cubit.dart';
import '../../States/onboarding_state.dart';

class OnBoardingHeader extends StatelessWidget {
  const OnBoardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          OnBoardingCubit onBoardingCubit = OnBoardingCubit.get(context);
          return Container(
            height: 50,
            margin: const EdgeInsets.only(
              left: 24,
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/Logo.png",
                  width: 81,
                  height: 19,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: GestureDetector(
                    onTap: onBoardingCubit.onSkipClick,
                    child: Text(
                      "Skip",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

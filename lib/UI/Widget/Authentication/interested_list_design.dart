import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Shared/Style/Color/color.dart';
import '../../Cubits/information_register_cubit.dart';
import '../../States/information_register_state.dart';

class InterestedListDesign extends StatelessWidget {
  final String image;
  final String title;
  final Color backgroundContainer;
  final Color borderContainerColor;
  final Color imageColor;

  final Function() onTap;

  const InterestedListDesign({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
    required this.backgroundContainer,
    required this.borderContainerColor,
    required this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InformationRegisterCubit, InformationRegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          InformationRegisterCubit informationRegisterCubit =
              InformationRegisterCubit.get(context);
          return GestureDetector(
            onTap: onTap,
            child: Container(
              height: 125,
              width: 156,
              decoration: BoxDecoration(
                color: backgroundContainer,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: borderContainerColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: borderContainerColor,
                      radius: 26,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColor.backgroundContainer,
                        child: Image.asset(
                          image,
                          color: imageColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: AppColor.textHeaderColor),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

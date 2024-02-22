import 'package:flutter/material.dart';

import '../../../Shared/Components/button_components.dart';
import '../../../Shared/Style/Color/color.dart';
import '../../../Shared/Style/Image/image_assets.dart';

class BottomDesignLoginRegister extends StatelessWidget {
  final String textDivider;
  final Function()? googleOnPressed;
  final Function()? facebookOnPressed;

  const BottomDesignLoginRegister({
    super.key,
    required this.textDivider,
    this.googleOnPressed,
    this.facebookOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: AppColor.textButtonColor,
                border: Border.all(width: .1),
              ),
              width: 80,
            ),
            Text(
              textDivider,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 14,
                    color: AppColor.textButtonColor,
                  ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: AppColor.textButtonColor,
                border: Border.all(width: .1),
              ),
              width: 80,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonComponents(
                buttonText: 'Google',
                onPressed: googleOnPressed,
                backgroundColor: AppColor.textButtonColorClicked,
                textColor: AppColor.textHeaderColor,
                height: 50,
                width: 154,
                radius: 8,
                borderColor: AppColor.borderTextForm,
                widthSizedBox: 10,
                icon: Image.asset(
                  AppImageAssets.googleImage,
                  width: 16,
                  height: 16,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ButtonComponents(
                buttonText: 'Facebook',
                onPressed: facebookOnPressed,
                backgroundColor: AppColor.textButtonColorClicked,
                textColor: AppColor.textHeaderColor,
                height: 50,
                width: 154,
                radius: 8,
                borderColor: AppColor.borderTextForm,
                widthSizedBox: 10,
                icon: Image.asset(
                  AppImageAssets.facebookImage,
                  width: 16,
                  height: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

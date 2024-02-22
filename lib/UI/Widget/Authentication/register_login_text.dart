import 'package:flutter/material.dart';

import '../../../Shared/Style/Color/color.dart';

class RegisterLoginText extends StatelessWidget {
  final String questionText;
  final String textButton;
  final Function() onTap;

  const RegisterLoginText({
    super.key,
    required this.questionText,
    required this.textButton,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 14,
                color: AppColor.textHeaderColor,
              ),
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            textButton,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 14,
                  color: AppColor.primaryColor,
                ),
          ),
        ),
      ],
    );
  }
}

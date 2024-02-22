import 'package:flutter/material.dart';

import '../Style/Color/color.dart';

class ButtonComponents extends StatelessWidget {
  final Color backgroundColor;

  final String buttonText;
  final Color textColor;
  final double height;
  final double width;
  final double radius;
  final Color borderColor;
  final Widget icon;
  final double widthSizedBox;
  final Function()? onPressed;
  EdgeInsetsGeometry? padding;

  ButtonComponents({
    super.key,
    required this.buttonText,
    this.backgroundColor = AppColor.primaryColor,
    this.textColor = AppColor.textButtonColorClicked,
    this.onPressed,
    this.height = 48,
    this.width = 327,
    this.radius = 1000,
    this.borderColor = AppColor.textButtonColorClicked,
    this.icon = const Text(''),
    this.widthSizedBox = 0,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: borderColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              width: widthSizedBox,
            ),
            Text(
              buttonText,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: textColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

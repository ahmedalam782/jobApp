import 'package:flutter/material.dart';

import '../../Shared/Style/Color/color.dart';

class AppHeaderTitle extends StatelessWidget {
  final String headerTitle;
  final String subTitle;
  final double fontSizeHeaderTitle;
  final double fontSizeSubTitle;

  final Color colorHeaderTitle;
  final Color colorSubTitle;

  const AppHeaderTitle({
    super.key,
    required this.headerTitle,
    required this.subTitle,
    this.fontSizeHeaderTitle = 28,
    this.colorHeaderTitle = AppColor.textHeaderColor,
    this.colorSubTitle = AppColor.textButtonColor,
    this.fontSizeSubTitle = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            headerTitle,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: fontSizeHeaderTitle,
                  color: colorHeaderTitle,
                ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            subTitle,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colorSubTitle,
                  fontSize: fontSizeSubTitle,
                ),
          ),
        ),
      ],
    );
  }
}

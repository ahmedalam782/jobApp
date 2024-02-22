import 'package:flutter/material.dart';

import '../../../Shared/Style/Color/color.dart';

class CountryListDesign extends StatelessWidget {
  final String image;
  final String title;
  final Color backgroundContainer;
  final Color borderContainerColor;
  final Function() onTap;

  const CountryListDesign({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
    required this.backgroundContainer,
    required this.borderContainerColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundContainer,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 1,
            color: borderContainerColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(image),
              const SizedBox(
                width: 12,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColor.textHeaderColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

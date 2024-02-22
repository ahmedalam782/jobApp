import 'package:flutter/material.dart';

import '../../../Shared/Style/Color/color.dart';

class LanguagesDesign extends StatelessWidget {
  const LanguagesDesign({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 64,
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          child: Row(
            children: [
              Image.asset(
                height: 20,
                width: 30,
                image,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontSize: 16),
              ),
              const Spacer(),
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: 1,
                  groupValue: 1,
                  onChanged: (value) {},
                  fillColor: MaterialStateProperty.all(AppColor.primaryColor),
                ),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Divider(),
        ),
      ],
    );
  }
}

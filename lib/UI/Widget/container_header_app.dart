import 'package:flutter/material.dart';

import '../../Shared/Style/Color/color.dart';

class ContainerHeaderApp extends StatelessWidget {
  const ContainerHeaderApp({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: AppColor.backgroundContainer,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontSize: 14,
            ),
      ),
    );
  }
}

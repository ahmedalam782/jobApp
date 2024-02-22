import 'package:flutter/material.dart';

import '../../Shared/Style/Image/image_assets.dart';

class HeaderImageApp extends StatelessWidget {
  const HeaderImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      height: 100,
      padding: const EdgeInsets.all(12),
      child: Image.asset(
        AppImageAssets.logoImage,
        width: 81,
        height: 19,
      ),
    );
  }
}

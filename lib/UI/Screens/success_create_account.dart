import 'package:flutter/material.dart';

import '../../Shared/Components/button_components.dart';
import '../../Shared/Style/Image/image_assets.dart';
import '../Widget/App_head_title.dart';

class SuccessCreateAccount extends StatelessWidget {
  static const String routeName = 'SuccessCreateAccount';

  const SuccessCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset(
            AppImageAssets.successAccountImage,
            width: double.infinity,
          ),
          const AppHeaderTitle(
            headerTitle: 'Your account has been set up!',
            subTitle: 'We have customized feeds according to your preferences',
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: ButtonComponents(
              buttonText: 'Get Started',
              onPressed: () => Navigator.pop(context),
            ),
          )
        ],
      ),
    );
  }
}

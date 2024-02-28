import 'package:flutter/material.dart';

import '../../Shared/Components/button_components.dart';
import '../../Shared/Components/text_form_components.dart';
import '../../Shared/Style/Image/image_assets.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  static const String routeName = 'ChangePasswordScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Change password',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 20,
                ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: Text(
              'Enter your old password',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          TextFormComponents(
            hintText: 'Old Password',
            prefixIcon: Image.asset(
              AppImageAssets.lockImage,
            ),
            suffixIcon: InkWell(
              onTap: () {},
              child: Image.asset(
                AppImageAssets.eyeSlashImage,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: Text(
              'Enter your new password',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          TextFormComponents(
            hintText: 'New Password',
            prefixIcon: Image.asset(
              AppImageAssets.lockImage,
            ),
            suffixIcon: InkWell(
              onTap: () {},
              child: Image.asset(
                AppImageAssets.eyeSlashImage,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: Text(
              'Confirm your new password',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          TextFormComponents(
            hintText: 'Confirm Password',
            prefixIcon: Image.asset(
              AppImageAssets.lockImage,
            ),
            suffixIcon: InkWell(
              onTap: () {},
              child: Image.asset(
                AppImageAssets.eyeSlashImage,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Center(child: ButtonComponents(buttonText: 'Save')),
          ),
        ],
      ),
    );
  }
}

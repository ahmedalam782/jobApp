import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:j_bsque/UI/Screens/two_step_verification_verify_code.dart';

import '../../Shared/Components/button_components.dart';
import '../../Shared/Components/text_form_components.dart';
import '../../Shared/Style/Color/color.dart';
import '../../Shared/Style/Image/image_assets.dart';

class TwoStepVerificationSendCode extends StatelessWidget {
  const TwoStepVerificationSendCode({super.key});

  static const String routeName = 'TwoStepVerificationSendCode';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Two-step verification',
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
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5),
            child: Text(
              'Add phone number',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 16,
                    color: AppColor.textHeaderColor,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'We will send a verification code to this number',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 14,
                  ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: IntlPhoneField(
              flagsButtonMargin: const EdgeInsets.all(16),
              dropdownIconPosition: IconPosition.trailing,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColor.borderTextForm,
                    ),
                  )),
              initialCountryCode: 'EG',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: Text(
              'Enter your password',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          TextFormComponents(
            hintText: 'Password',
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
            child: Center(
              child: ButtonComponents(
                buttonText: 'Send Code',
                onPressed: () => Navigator.pushNamed(
                    context, TwoStepVerificationVerifyCode.routeName),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

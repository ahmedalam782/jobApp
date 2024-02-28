import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:j_bsque/Shared/Style/Color/color.dart';
import 'package:j_bsque/Shared/Style/Image/image_assets.dart';
import 'package:j_bsque/UI/Screens/two_step_verification_send_code.dart';

import '../../Shared/Components/button_components.dart';
import '../Widget/profile/content_list_view.dart';

class TwoStepVerificationScreen extends StatelessWidget {
  TwoStepVerificationScreen({super.key});

  static const String routeName = 'TwoStepVerificationScreen';
  final List<String> items = [
    'Telephone number (SMS)',
    'Email Addresses',
  ];
  String? selectedValue;

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
          Container(
            height: 66,
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.borderTextForm,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Secure your account with\n two-step verification",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 16,
                      ),
                ),
                Switch(
                  thumbColor: MaterialStateProperty.all(
                    AppColor.textButtonColorClicked,
                  ),
                  trackOutlineColor: MaterialStateProperty.all(
                    AppColor.borderTextForm,
                  ),
                  inactiveTrackColor: AppColor.borderTextForm,
                  activeTrackColor: Theme.of(context).primaryColor,
                  value: false,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: Text(
              'Select a verification method',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: AppColor.textHeaderColor),
            ),
          ),
          Container(
            height: 56,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.borderTextForm,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                items: items
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize: 14,
                                  )),
                        ))
                    .toList(),
                value: items[0],
                onChanged: (String? value) {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: Text(
              'Note : Turning this feature will sign you out anywhere'
              ' you’re currently signed in. We will then require '
              'you to enter a verification code the first time '
              'you sign with a new device or Joby mobile application.',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ContentListView(
            title: 'Two-step verification provides '
                'additional\n security by asking for a '
                'verification code\n every time '
                'you log in on another device.',
            image: Image.asset(AppImageAssets.loginAndSecurityImage),
            icon: const SizedBox(),
            divider: const SizedBox(),
          ),
          const SizedBox(
            height: 15,
          ),
          ContentListView(
            title: 'Adding a phone number or using an\n authenticator '
                'will help keep your account \nsafe from harm.',
            image: Image.asset(AppImageAssets.phoneImage),
            icon: const SizedBox(),
            divider: const SizedBox(),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Center(
              child: ButtonComponents(
                buttonText: 'Next',
                onPressed: () => Navigator.pushNamed(
                    context, TwoStepVerificationSendCode.routeName),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

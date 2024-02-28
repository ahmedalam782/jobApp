import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../Shared/Components/button_components.dart';
import '../../Shared/Style/Color/color.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  static const String routeName = 'PhoneNumberScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Phone number',
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
              'Main phone number',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
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
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Use the phone number to reset your\n password",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontSize: 14),
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

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Shared/Components/button_components.dart';
import '../../Shared/Style/Color/color.dart';

class TwoStepVerificationVerifyCode extends StatelessWidget {
  const TwoStepVerificationVerifyCode({super.key});

  static const String routeName = 'TwoStepVerificationVerifyCode';

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
              'Enter the 6 digit code',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 16,
                    color: AppColor.textHeaderColor,
                  ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Please confirm your account by entering \nthe authorization code sen to ****-****-7234',
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
            child: PinCodeTextField(
              appContext: context,
              pastedTextStyle: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontSize: 14),
              length: 6,
              blinkWhenObscuring: true,
              animationType: AnimationType.scale,
              validator: (v) {
                if (v!.length < 3) {
                  return "";
                } else {
                  return null;
                }
              },
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 44,
                  fieldWidth: 44,
                  activeFillColor: Colors.white,
                  inactiveColor: AppColor.borderTextForm,
                  selectedColor: AppColor.borderTextForm,
                  activeColor: AppColor.primaryColor),
              cursorColor: AppColor.textHeaderColor,
              animationDuration: const Duration(milliseconds: 300),
              keyboardType: TextInputType.number,
              boxShadows: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.black12,
                  blurRadius: 10,
                )
              ],
              onCompleted: (v) {
                debugPrint("Completed");
              },
              onChanged: (value) {
                debugPrint(value);
              },
              beforeTextPaste: (text) {
                debugPrint("Allowing to paste $text");
                return true;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Text(
                  'Resend code',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 16,
                        color: AppColor.hintTextForm,
                      ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '42s',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 16,
                        color: AppColor.primaryColor,
                      ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Center(
              child: ButtonComponents(
                buttonText: 'Verify',
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

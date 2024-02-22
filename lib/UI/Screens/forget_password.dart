import 'package:flutter/material.dart';

import '../../Shared/Components/button_components.dart';
import '../../Shared/Components/text_form_components.dart';
import '../../Shared/Style/Image/image_assets.dart';
import '../Widget/App_head_title.dart';
import '../Widget/Authentication/register_login_text.dart';
import '../Widget/header_image_app.dart';

class ForgetPassword extends StatelessWidget {
  static const String routeName = 'ForgetPassword';

  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: const [
          HeaderImageApp(),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppHeaderTitle(
              headerTitle: 'Reset Password',
              subTitle:
                  "Enter the email address you used when you joined and we’ll send you instructions to reset your password.",
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormComponents(
              hintText: 'Email',
              prefixIcon: Image.asset(AppImageAssets.smsImage),
            ),
            const Spacer(),
            RegisterLoginText(
              questionText: 'You remember your password',
              textButton: 'Login',
              onTap: () => Navigator.pop(context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 24,
              ),
              child: ButtonComponents(
                buttonText: 'Request password reset',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

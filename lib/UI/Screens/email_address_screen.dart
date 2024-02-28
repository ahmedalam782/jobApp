import 'package:flutter/material.dart';
import 'package:j_bsque/Shared/Components/button_components.dart';
import 'package:j_bsque/Shared/Components/text_form_components.dart';
import 'package:j_bsque/Shared/Style/Image/image_assets.dart';

class EmailAddressScreen extends StatelessWidget {
  const EmailAddressScreen({super.key});

  static const String routeName = 'EmailAddressScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Email address',
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
              'Main e-mail address',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          TextFormComponents(
            hintText: 'Email address',
            prefixIcon: Image.asset(AppImageAssets.smsImage),
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

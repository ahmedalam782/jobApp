import 'package:flutter/material.dart';

import '../../../Shared/Style/Color/color.dart';
import '../../Screens/forget_password.dart';

class LoginForgetPassword extends StatelessWidget {
  final bool valueCheckbox;
  final Function(bool?)? onChangedCheckbox;
  final Color fillColorCheckbox;

  const LoginForgetPassword({
    super.key,
    required this.valueCheckbox,
    required this.onChangedCheckbox,
    required this.fillColorCheckbox,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Checkbox(
              value: valueCheckbox,
              onChanged: onChangedCheckbox,
              checkColor: AppColor.textButtonColorClicked,
              fillColor: MaterialStateProperty.all(fillColorCheckbox)),
          const SizedBox(
            width: 5,
          ),
          Text(
            'Remember me',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 14,
                  color: AppColor.textHeaderColor,
                ),
          ),
          const Spacer(),
          InkWell(
            onTap: () => Navigator.pushNamed(context, ForgetPassword.routeName),
            child: Text(
              'Forgot Password?',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

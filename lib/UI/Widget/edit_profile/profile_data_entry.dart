import 'package:flutter/material.dart';

import '../../../Shared/Components/text_form_components.dart';
import '../../../Shared/Style/Color/color.dart';

class EditProfileData extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;

  const EditProfileData({
    super.key,
    required this.title,
    required this.controller,
    required this.validator,
    required this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5),
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 16, color: AppColor.hintTextForm)),
        ),
        TextFormComponents(
          controller: controller,
          keyboardType: TextInputType.text,
          maxHeight: 82,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}

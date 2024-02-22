import 'package:flutter/material.dart';

import '../Style/Color/color.dart';

class TextFormComponents extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final double radius;
  final double maxHeight;
  final double maxWidth;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const TextFormComponents({
    super.key,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.errorText,
    this.radius = 8,
    this.maxHeight = 56,
    this.maxWidth = 327,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          errorText: errorText,
          errorStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: AppColor.textFormWrongColor,
                fontSize: 14,
              ),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 14,
                color: AppColor.hintTextForm,
              ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              width: 1,
              color: AppColor.borderTextForm,
            ),
          ),
        ),
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}

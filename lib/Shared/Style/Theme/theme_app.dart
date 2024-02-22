import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:j_bsque/Shared/Style/Color/color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.textButtonColorClicked,
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColor.primaryColor),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColor.primaryColor,
      actionTextColor: AppColor.primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.textButtonColorClicked,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.textButtonColorClicked,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColor.primaryColor,
      unselectedItemColor: AppColor.hintTextForm,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
        fontSize: 32,
        color: AppColor.textHeaderColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColor.textButtonColor,
      ),
    ),
  );
}

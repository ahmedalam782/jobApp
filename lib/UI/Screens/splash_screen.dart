import 'package:flutter/material.dart';
import 'package:j_bsque/Shared/Constant/constant.dart';
import 'package:j_bsque/UI/Screens/home_screen.dart';
import 'package:j_bsque/UI/Screens/login_screen.dart';

import '../../Shared/Style/Image/image_assets.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        ConstantData.isLogin = true;
        return ConstantData.isFirstOpen != null
            ? ConstantData.rememberMe != null
                ? Navigator.pushReplacementNamed(context, HomeScreen.routeName)
                : Navigator.pushReplacementNamed(context, LoginScreen.routeName)
            : Navigator.pushReplacementNamed(
                context, OnboardingScreen.routeName);
      },
    );
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            AppImageAssets.backgroundSplashImage,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          Image.asset(
            AppImageAssets.logoImage,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}

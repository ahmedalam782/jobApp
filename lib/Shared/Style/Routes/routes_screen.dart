import 'package:flutter/material.dart';

import '../../../UI/Screens/edit_profile.dart';
import '../../../UI/Screens/forget_password.dart';
import '../../../UI/Screens/help_center.dart';
import '../../../UI/Screens/home_screen.dart';
import '../../../UI/Screens/languages_screen.dart';
import '../../../UI/Screens/login_screen.dart';
import '../../../UI/Screens/notification_screen.dart';
import '../../../UI/Screens/onboarding_screen.dart';
import '../../../UI/Screens/portfolio_screen.dart';
import '../../../UI/Screens/privacy_policy.dart';
import '../../../UI/Screens/register_screen.dart';
import '../../../UI/Screens/register_screen_information_one.dart';
import '../../../UI/Screens/register_screen_information_two.dart';
import '../../../UI/Screens/splash_screen.dart';
import '../../../UI/Screens/success_create_account.dart';
import '../../../UI/Screens/terms_conditions.dart';

class RoutesScreen {
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.routeName: (_) => const SplashScreen(),
    OnboardingScreen.routeName: (_) => const OnboardingScreen(),
    LoginScreen.routeName: (_) => const LoginScreen(),
    RegisterScreen.routeName: (_) => const RegisterScreen(),
    ForgetPassword.routeName: (_) => const ForgetPassword(),
    RegisterScreenInformationOne.routeName: (_) =>
        const RegisterScreenInformationOne(),
    RegisterScreenInformationTwo.routeName: (_) =>
        RegisterScreenInformationTwo(),
    SuccessCreateAccount.routeName: (_) => const SuccessCreateAccount(),
    HomeScreen.routeName: (_) => const HomeScreen(),
    EditProfile.routeName: (_) => const EditProfile(),
    HelpCenter.routeName: (_) => const HelpCenter(),
    PrivacyPolicy.routeName: (_) => const PrivacyPolicy(),
    TermsConditions.routeName: (_) => const TermsConditions(),
    PortfolioScreen.routeName: (_) => PortfolioScreen(),
    LanguagesScreen.routeName: (_) => LanguagesScreen(),
    NotificationScreen.routeName: (_) => NotificationScreen(),
  };
}

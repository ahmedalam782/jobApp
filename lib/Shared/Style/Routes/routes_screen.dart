import 'package:flutter/material.dart';

import '../../../UI/Screens/change_password_screen.dart';
import '../../../UI/Screens/edit_profile.dart';
import '../../../UI/Screens/email_address_screen.dart';
import '../../../UI/Screens/forget_password.dart';
import '../../../UI/Screens/help_center.dart';
import '../../../UI/Screens/home_screen.dart';
import '../../../UI/Screens/languages_screen.dart';
import '../../../UI/Screens/login-and_security.dart';
import '../../../UI/Screens/login_screen.dart';
import '../../../UI/Screens/notification_Screen.dart';
import '../../../UI/Screens/notification_setting_screen.dart';
import '../../../UI/Screens/onboarding_screen.dart';
import '../../../UI/Screens/phone_number_screen.dart';
import '../../../UI/Screens/portfolio_screen.dart';
import '../../../UI/Screens/privacy_policy.dart';
import '../../../UI/Screens/register_screen.dart';
import '../../../UI/Screens/register_screen_information_one.dart';
import '../../../UI/Screens/register_screen_information_two.dart';
import '../../../UI/Screens/splash_screen.dart';
import '../../../UI/Screens/success_create_account.dart';
import '../../../UI/Screens/terms_conditions.dart';
import '../../../UI/Screens/two_step_verification.dart';
import '../../../UI/Screens/two_step_verification_send_code.dart';
import '../../../UI/Screens/two_step_verification_verify_code.dart';

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
    NotificationSettingScreen.routeName: (_) => NotificationSettingScreen(),
    LoginAndSecurity.routeName: (_) => LoginAndSecurity(),
    EmailAddressScreen.routeName: (_) => EmailAddressScreen(),
    PhoneNumberScreen.routeName: (_) => PhoneNumberScreen(),
    ChangePasswordScreen.routeName: (_) => ChangePasswordScreen(),
    TwoStepVerificationScreen.routeName: (_) => TwoStepVerificationScreen(),
    TwoStepVerificationSendCode.routeName: (_) => TwoStepVerificationSendCode(),
    TwoStepVerificationVerifyCode.routeName: (_) =>
        TwoStepVerificationVerifyCode(),
    NotificationScreen.routeName: (_) => NotificationScreen(),
  };
}

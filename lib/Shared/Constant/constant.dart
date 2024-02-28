import 'package:flutter/material.dart';

import '../../Model/content_button_list_model.dart';
import '../../Model/country_register_model.dart';
import '../../Model/edit_profile_data_model.dart';
import '../../Model/interested_register_model.dart';
import '../../Model/language_model.dart';
import '../../Model/onboarding_model.dart';
import '../../UI/Screens/change_password_screen.dart';
import '../../UI/Screens/edit_profile.dart';
import '../../UI/Screens/email_address_screen.dart';
import '../../UI/Screens/help_center.dart';
import '../../UI/Screens/languages_screen.dart';
import '../../UI/Screens/login-and_security.dart';
import '../../UI/Screens/notification_setting_screen.dart';
import '../../UI/Screens/phone_number_screen.dart';
import '../../UI/Screens/portfolio_screen.dart';
import '../../UI/Screens/privacy_policy.dart';
import '../../UI/Screens/terms_conditions.dart';
import '../../UI/Screens/two_step_verification.dart';
import '../Style/Image/image_assets.dart';

class ConstantData {
  static final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: AppImageAssets.onBoardingImageOne,
      body: 'Find a job, and',
      bodyBlue: ' start building',
      bodyNotBlue: ' your career\nfrom now on',
      subBody:
          'Explore over 25,924 available job roles and \nupgrade your operator now.',
    ),
    OnboardingModel(
      image: AppImageAssets.onBoardingImageTwo,
      body: 'Hundreds of jobs are waiting for you to',
      bodyBlue: ' join together',
      bodyNotBlue: '',
      subBody:
          'Immediately join us and start applying for the\n job you are interested in.',
    ),
    OnboardingModel(
      image: AppImageAssets.onBoardingImageThree,
      body: 'Get the best',
      bodyBlue: ' choice for \nthe job',
      bodyNotBlue: " you've always dreamed of",
      subBody:
          'The better the skills you have, the greater the\n good job opportunities for you.',
    ),
  ];
  static final List<InterestedRegisterModel> interestedRegisterList = [
    InterestedRegisterModel(
      image: AppImageAssets.bezierImage,
      title: 'UI/UX Designer',
    ),
    InterestedRegisterModel(
      image: AppImageAssets.penToolImage,
      title: 'Illustrator Designer',
    ),
    InterestedRegisterModel(
      image: AppImageAssets.codeImage,
      title: 'Developer',
    ),
    InterestedRegisterModel(
      image: AppImageAssets.graphImage,
      title: 'Management',
    ),
    InterestedRegisterModel(
      image: AppImageAssets.monitorMobileImage,
      title: 'Information Technology',
    ),
    InterestedRegisterModel(
      image: AppImageAssets.cloudAddImage,
      title: 'Research and Analytics',
    ),
  ];
  static final List<CountryRegisterModel> countryRegisterList = [
    CountryRegisterModel(
      image: AppImageAssets.usImage,
      title: 'United States',
    ),
    CountryRegisterModel(
      image: AppImageAssets.malaysiaImage,
      title: 'Malaysia',
    ),
    CountryRegisterModel(
      image: AppImageAssets.singaporeImage,
      title: 'Singapore',
    ),
    CountryRegisterModel(
      image: AppImageAssets.indonesiaImage,
      title: 'Indonesia',
    ),
    CountryRegisterModel(
      image: AppImageAssets.philiphinesImage,
      title: 'Philiphines',
    ),
    CountryRegisterModel(
      image: AppImageAssets.polandiaImage,
      title: 'Polandia',
    ),
    CountryRegisterModel(
      image: AppImageAssets.indiaImage,
      title: 'India',
    ),
    CountryRegisterModel(
      image: AppImageAssets.vietnamImage,
      title: 'Vietnam',
    ),
    CountryRegisterModel(
      image: AppImageAssets.chinaImage,
      title: 'China',
    ),
    CountryRegisterModel(
      image: AppImageAssets.canadaImage,
      title: 'Canada',
    ),
    CountryRegisterModel(
      image: AppImageAssets.saudiArabiaImage,
      title: 'Saudi Arabia',
    ),
    CountryRegisterModel(
      image: AppImageAssets.argentinaImage,
      title: 'Argentina',
    ),
    CountryRegisterModel(
      image: AppImageAssets.brazilImage,
      title: 'Brazil',
    ),
  ];
  static final List<EditProfileDataModel> editProfileDataModel = [
    EditProfileDataModel(title: 'Name', controller: TextEditingController()),
    EditProfileDataModel(title: 'Bio', controller: TextEditingController()),
    EditProfileDataModel(title: 'Address', controller: TextEditingController()),
  ];
  static final List<ContentButtonListModel> generalProfile = [
    ContentButtonListModel(
      title: 'Edit Profile',
      image: Image.asset(AppImageAssets.editProfileImage),
      routeName: EditProfile.routeName,
    ),
    ContentButtonListModel(
      title: 'Portfolio',
      image: Image.asset(AppImageAssets.portfolioImage),
      routeName: PortfolioScreen.routeName,
    ),
    ContentButtonListModel(
      title: 'Langauge',
      image: Image.asset(AppImageAssets.langaugeImage),
      routeName: LanguagesScreen.routeName,
    ),
    ContentButtonListModel(
      title: 'Notification',
      image: Image.asset(AppImageAssets.notification2Image),
      routeName: NotificationSettingScreen.routeName,
    ),
    ContentButtonListModel(
      title: 'Login and security',
      image: Image.asset(AppImageAssets.loginAndSecurityImage),
      routeName: LoginAndSecurity.routeName,
    ),
  ];
  static final List<ContentButtonListModel> otherProfile = [
    ContentButtonListModel(
      title: 'Accessibility',
      routeName: '',
    ),
    ContentButtonListModel(
      title: 'Help Center',
      routeName: HelpCenter.routeName,
    ),
    ContentButtonListModel(
      title: 'Terms & Conditions',
      routeName: TermsConditions.routeName,
    ),
    ContentButtonListModel(
      title: 'Privacy Policy',
      routeName: PrivacyPolicy.routeName,
    ),
  ];
  static final List<LanguagesModels> languagesModels = [
    LanguagesModels(image: AppImageAssets.englandImage, title: "English"),
    LanguagesModels(image: AppImageAssets.saudiArabia2Image, title: "Arabic"),
  ];
  static final List<ContentButtonListModel> jobNotification = [
    ContentButtonListModel(
      title: 'Your Job Search Alert',
    ),
    ContentButtonListModel(
      title: 'Job Application Update',
    ),
    ContentButtonListModel(
      title: 'Job Application Reminders',
    ),
    ContentButtonListModel(
      title: 'Jobs You May Be Interested In',
    ),
    ContentButtonListModel(
      title: 'Job Seeker Updates',
    ),
  ];
  static final List<ContentButtonListModel> otherNotification = [
    ContentButtonListModel(
      title: 'Show Profile',
    ),
    ContentButtonListModel(
      title: 'All Message',
    ),
    ContentButtonListModel(
      title: 'Message Nudges',
    ),
  ];
  static final List<ContentButtonListModel> accountAccess = [
    ContentButtonListModel(
      title: 'Email address',
      text: 'rafifdian12@gmail.com',
      routeName: EmailAddressScreen.routeName,
    ),
    ContentButtonListModel(
      title: 'Phone number',
      routeName: PhoneNumberScreen.routeName,
    ),
    ContentButtonListModel(
      title: 'Change password',
      routeName: ChangePasswordScreen.routeName,
    ),
    ContentButtonListModel(
      title: 'Two-step verification',
      text: 'Non active',
      routeName: TwoStepVerificationScreen.routeName,
    ),
    ContentButtonListModel(
      title: 'Face ID',
    ),
  ];

  static final List<String> locationWork = ['Work From Office', 'Remote Work'];
  static final List<String> typeAppliedJob = ['Active', 'Rejected'];

  static bool isRemote = false;
  static bool isLogin = true;
  static String isFirstOpenApp = 'First Install';
  static String isRememberMe = 'remember me';
  static late String interestedWork;
  static late String addressLocation;
  static String? isFirstOpen;
  static String? rememberMe;
}

class APIConstantData {
  static const String baseUrl = 'https://project2.amit-learning.com/api/';
  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String editProfile = 'user/profile/edit';
  static const String profile = 'auth/profile';
  static const String updateUser = 'auth/user/update';
  static const String addPortfolio = 'user/profile/portofolios';
  static const String getPortfolio = 'user/profile/portofolios';
  static const String getSuggestedJob = 'jobs/sugest/3';

  static const String status = 'status';
  static const String errorLoginMessage = 'massage';
  static const String errorRegisterMessage = 'massege';
  static const String errorSuggestedJob = 'message';
  static const String email = 'email';
  static const String password = 'password';
  static const String name = 'name';
  static const String token = 'token';
  static const String id = 'id';
  static const String user = 'user';
  static const String data = 'data';
  static const String authorization = 'Authorization';
  static const String interestedWork = 'interested_work';
  static const String address = 'address';
  static const String remotePlace = 'remote_place';
  static const String offlinePlace = 'offline_place';
  static const String cvFile = 'cv_file';
  static const String image = 'image';
  static const String bio = 'bio';
  static const String mobile = 'mobile';
  static const String jobType = 'job_type';
  static const String companyName = 'comp_name';
  static const String salary = 'salary';
  static const String jobTimeType = 'job_time_type';
  static const String jobLevel = 'job_level';
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Shared/Constant/constant.dart';
import 'Shared/Style/Bloc Observer/bloc_observer.dart';
import 'Shared/Style/Routes/routes_screen.dart';
import 'Shared/Style/Theme/theme_app.dart';
import 'Shared/network/local/cache_helper.dart';
import 'Shared/network/remote/API/dio_consumer.dart';
import 'UI/Cubits/login_cubit.dart';
import 'UI/Cubits/onboarding_cubit.dart';
import 'UI/Screens/splash_screen.dart';
import 'UI/States/login_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await CacheHelper().init();
  ConstantData.isFirstOpen =
      CacheHelper.getData(key: ConstantData.isFirstOpenApp);
  ConstantData.rememberMe = CacheHelper.getData(key: ConstantData.isRememberMe);

  Bloc.observer = const SimpleBlocObserver();
  runApp(const JobApp());
}

class JobApp extends StatelessWidget {
  const JobApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnBoardingCubit()),
        BlocProvider(
            create: (context) =>
                LoginCubit(apiConsumer: DioConsumer(dio: Dio()))),
      ],
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, LoginStates state) {},
        builder: (BuildContext context, LoginStates state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: RoutesScreen.routes,
            initialRoute: SplashScreen.routeName,
            theme: AppTheme.lightTheme,
          );
        },
      ),
    );
  }
}

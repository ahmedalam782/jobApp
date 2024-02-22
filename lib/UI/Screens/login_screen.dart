import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_bsque/Shared/network/remote/API/dio_consumer.dart';
import 'package:j_bsque/UI/Screens/home_screen.dart';

import '../../Shared/Components/button_components.dart';
import '../../Shared/Components/text_form_components.dart';
import '../../Shared/Constant/constant.dart';
import '../../Shared/Style/Color/color.dart';
import '../../Shared/Style/Image/image_assets.dart';
import '../Cubits/login_cubit.dart';
import '../States/login_state.dart';
import '../Widget/App_head_title.dart';
import '../Widget/Authentication/bottom_design_login_register.dart';
import '../Widget/Authentication/login_forget_password.dart';
import '../Widget/Authentication/register_login_text.dart';
import '../Widget/header_image_app.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          LoginCubit(apiConsumer: DioConsumer(dio: Dio())),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          } else if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${state.error} or email "),
              ),
            );
          }
        },
        builder: (context, state) {
          LoginCubit loginCubit = LoginCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              actions: const [
                HeaderImageApp(),
              ],
            ),
            body: SafeArea(
              child: Form(
                key: loginCubit.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppHeaderTitle(
                      headerTitle: 'Login',
                      subTitle: 'Please login to find your dream job',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormComponents(
                      controller: loginCubit.emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Email Address',
                      prefixIcon: Image.asset(
                        AppImageAssets.smsImage,
                        color: AppColor.textHeaderColor,
                      ),
                      validator: loginCubit.validateEmail,
                      onFieldSubmitted: loginCubit.onSubmitForm,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormComponents(
                      controller: loginCubit.passwordTextEditingController,
                      keyboardType: TextInputType.text,
                      hintText: 'Password',
                      obscureText: loginCubit.isPassword,
                      prefixIcon: Image.asset(
                        AppImageAssets.lockImage,
                        color: AppColor.textHeaderColor,
                      ),
                      suffixIcon: InkWell(
                        onTap: loginCubit.changePasswordVisibility,
                        child: Image.asset(
                          loginCubit.suffixImage,
                          color: AppColor.textHeaderColor,
                        ),
                      ),
                      validator: loginCubit.validatePassword,
                      onFieldSubmitted: loginCubit.onSubmitForm,
                    ),
                    LoginForgetPassword(
                      valueCheckbox: loginCubit.isChecked,
                      onChangedCheckbox: (bool? value) =>
                          loginCubit.checkRememberMe(),
                      fillColorCheckbox: loginCubit.fillColorCheckbox,
                    ),
                    const Spacer(),
                    RegisterLoginText(
                        questionText: "Don't have an account?",
                        textButton: 'Register',
                        onTap: () {
                          ConstantData.isLogin = false;
                          loginCubit.emailTextEditingController.clear();
                          loginCubit.passwordTextEditingController.clear();
                          return Navigator.pushNamed(
                              context, RegisterScreen.routeName);
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    ConditionalBuilder(
                      condition: state is! LoginLoadingState,
                      builder: (BuildContext context) => Center(
                        child: ButtonComponents(
                          buttonText: 'Login',
                          onPressed: loginCubit.isValid
                              ? () => loginCubit.signIn()
                              : null,
                          backgroundColor: loginCubit.isValid
                              ? AppColor.primaryColor
                              : AppColor.borderTextForm,
                          textColor: loginCubit.isValid
                              ? AppColor.textButtonColorClicked
                              : AppColor.textButtonColor,
                        ),
                      ),
                      fallback: (BuildContext context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const BottomDesignLoginRegister(
                      textDivider: 'Or Login With Account',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

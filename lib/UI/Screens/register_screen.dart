import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_bsque/Shared/Constant/constant.dart';
import 'package:j_bsque/UI/Screens/register_screen_information_one.dart';

import '../../Shared/Components/button_components.dart';
import '../../Shared/Components/text_form_components.dart';
import '../../Shared/Style/Color/color.dart';
import '../../Shared/Style/Image/image_assets.dart';
import '../../Shared/network/remote/API/dio_consumer.dart';
import '../Cubits/register_cubit.dart';
import '../States/register_state.dart';
import '../Widget/App_head_title.dart';
import '../Widget/Authentication/bottom_design_login_register.dart';
import '../Widget/Authentication/register_login_text.dart';
import '../Widget/header_image_app.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'RegisterScreen';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(apiConsumer: DioConsumer(dio: Dio())),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Navigator.pushReplacementNamed(
                context, RegisterScreenInformationOne.routeName);
          } else if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          RegisterCubit registerCubit = RegisterCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              actions: const [
                HeaderImageApp(),
              ],
            ),
            body: SafeArea(
              child: Form(
                key: registerCubit.registerFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppHeaderTitle(
                      headerTitle: 'Create Account',
                      subTitle:
                          'Please create an account to find your dream job',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormComponents(
                      controller: registerCubit.usernameTextEditingController,
                      hintText: 'Username',
                      prefixIcon: Image.asset(
                        AppImageAssets.profileImage,
                        color: registerCubit
                                .usernameTextEditingController.text.isNotEmpty
                            ? AppColor.textHeaderColor
                            : AppColor.hintTextForm,
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) =>
                          registerCubit.validAllForm(value, 'Username'),
                      onFieldSubmitted: registerCubit.onSubmitForm,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormComponents(
                      controller: registerCubit.emailTextEditingController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Image.asset(
                        AppImageAssets.smsImage,
                        color: registerCubit
                                .emailTextEditingController.text.isNotEmpty
                            ? AppColor.textHeaderColor
                            : AppColor.hintTextForm,
                      ),
                      validator: registerCubit.validateEmail,
                      onFieldSubmitted: registerCubit.onSubmitForm,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormComponents(
                      controller: registerCubit.passwordTextEditingController,
                      hintText: 'Password',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Image.asset(
                        AppImageAssets.lockImage,
                        color: registerCubit
                                .passwordTextEditingController.text.isNotEmpty
                            ? AppColor.textHeaderColor
                            : AppColor.hintTextForm,
                      ),
                      suffixIcon: InkWell(
                        onTap: registerCubit.changePasswordVisibility,
                        child: Image.asset(
                          registerCubit.suffixImage,
                          color: AppColor.textHeaderColor,
                        ),
                      ),
                      obscureText: registerCubit.isPassword,
                      errorText: registerCubit.textPassword ==
                              AppColor.textFormWrongColor
                          ? 'Password must be at least 8 characters'
                          : null,
                      validator: registerCubit.validatePassword,
                      onFieldSubmitted: registerCubit.onSubmitForm,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        registerCubit.textPassword == AppColor.hintTextForm
                            ? 'Password must be at least 8 characters'
                            : registerCubit.textPassword ==
                                    AppColor.textFormCorrectColor
                                ? 'Password must be at least 8 characters'
                                : '',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: registerCubit.textPassword),
                      ),
                    ),
                    const Spacer(),
                    RegisterLoginText(
                      questionText: "Already have an account?",
                      textButton: 'Login',
                      onTap: () {
                        ConstantData.isLogin = true;
                        return Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ConditionalBuilder(
                      condition: state is! RegisterLoadingState,
                      builder: (BuildContext context) => Center(
                        child: ButtonComponents(
                          buttonText: 'Create account',
                          onPressed: registerCubit.isValid
                              ? () => registerCubit.createAccount()
                              : null,
                          backgroundColor: registerCubit.isValid
                              ? AppColor.primaryColor
                              : AppColor.borderTextForm,
                          textColor: registerCubit.isValid
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
                      textDivider: 'Or Sign up With Account',
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

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_bsque/Shared/network/remote/API/dio_consumer.dart';
import 'package:j_bsque/UI/Screens/register_screen_information_two.dart';

import '../../Shared/Components/button_components.dart';
import '../Cubits/information_register_cubit.dart';
import '../States/information_register_state.dart';
import '../Widget/App_head_title.dart';
import '../Widget/Authentication/interested_wrap_design.dart';

class RegisterScreenInformationOne extends StatelessWidget {
  static const String routeName = 'RegisterScreenInformationOne';

  const RegisterScreenInformationOne({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InformationRegisterCubit(api: DioConsumer(dio: Dio())),
      child: BlocConsumer<InformationRegisterCubit, InformationRegisterState>(
          listener: (context, state) {
        if (state is InformationRegisterInterestedWorkSuccessState) {
          Navigator.pushReplacementNamed(
              context, RegisterScreenInformationTwo.routeName);
        } else if (state is InformationRegisterInterestedWorkErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('you must select one interested Work'),
            ),
          );
        }
      }, builder: (context, state) {
        InformationRegisterCubit informationRegisterCubit =
            InformationRegisterCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppHeaderTitle(
                  headerTitle: 'What type of work are you interested in?',
                  subTitle:
                      'Tell us what you’re interested in so we can customise the app for your needs.',
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: InterestedWrapDesign(),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: ButtonComponents(
                      buttonText: 'Next',
                      onPressed: () => informationRegisterCubit
                          .registerProfileInterestedWork(),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

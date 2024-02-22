import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_bsque/Shared/network/remote/API/dio_consumer.dart';
import 'package:j_bsque/UI/Screens/success_create_account.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../Shared/Components/button_components.dart';
import '../../Shared/Constant/constant.dart';
import '../../Shared/Style/Color/color.dart';
import '../Cubits/information_register_cubit.dart';
import '../States/information_register_state.dart';
import '../Widget/App_head_title.dart';
import '../Widget/Authentication/country_wrap_design.dart';

class RegisterScreenInformationTwo extends StatelessWidget {
  static const String routeName = 'RegisterScreenInformationTwo';
  int currentIndex = 1;

  RegisterScreenInformationTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InformationRegisterCubit(api: DioConsumer(dio: Dio())),
      child: BlocConsumer<InformationRegisterCubit, InformationRegisterState>(
        listener: (BuildContext context, InformationRegisterState state) {
          if (state is InformationRegisterSuccessState) {
            Navigator.pushReplacementNamed(
                context, SuccessCreateAccount.routeName);
          } else if (state is InformationRegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (BuildContext context, InformationRegisterState state) {
          InformationRegisterCubit informationRegisterCubit =
              InformationRegisterCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppHeaderTitle(
                    headerTitle: 'Where are you preferred Location?',
                    subTitle:
                        'Let us know, where is the work location you want at this time, so we can adjust it.',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ToggleSwitch(
                      cornerRadius: 100,
                      radiusStyle: true,
                      minWidth: 160,
                      minHeight: 40,
                      activeBgColors: const [
                        [
                          AppColor.backgroundToggleSwitchColor,
                        ],
                        [
                          AppColor.backgroundToggleSwitchColor,
                        ],
                      ],
                      inactiveFgColor: AppColor.textHeaderColor,
                      activeFgColor: AppColor.textButtonColorClicked,
                      inactiveBgColor: AppColor.borderTextForm,
                      initialLabelIndex: currentIndex,
                      totalSwitches: 2,
                      labels: ConstantData.locationWork,
                      onToggle: (index) {
                        currentIndex = index!;
                        if (currentIndex == 1) {
                          ConstantData.isRemote = true;
                        } else {
                          ConstantData.isRemote = false;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Select the country you want for your job',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    child: CountryWrapDesign(),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Center(
                      child: ButtonComponents(
                        buttonText: 'Next',
                        onPressed: () => informationRegisterCubit
                            .registerInformationProfile(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

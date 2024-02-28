import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../Shared/Constant/constant.dart';
import '../../../Shared/Style/Color/color.dart';
import '../../../Shared/Style/Image/image_assets.dart';
import '../App_head_title.dart';

class AppliedScreen extends StatelessWidget {
  AppliedScreen({super.key});

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.arrow_back,
                ),
                Center(
                  child: Text(
                    'Applied Job',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontSize: 20),
                  ),
                ),
                const Text(''),
              ],
            ),
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
              labels: ConstantData.typeAppliedJob,
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImageAssets.data2IlustrationImage),
                const SizedBox(
                  height: 10,
                ),
                ConstantData.isRemote
                    ? const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: AppHeaderTitle(
                          headerTitle: 'No applications were rejected',
                          fontSizeHeaderTitle: 24,
                          subTitle:
                              'If there is an application that is rejected by the company it will appear here',
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: AppHeaderTitle(
                          headerTitle: 'No applications were Active',
                          fontSizeHeaderTitle: 24,
                          subTitle:
                              'If there is an application that is Active by the company it will appear here',
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}

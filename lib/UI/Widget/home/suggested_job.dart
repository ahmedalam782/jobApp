import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Shared/Components/button_components.dart';
import '../../../Shared/Style/Color/color.dart';
import '../../../Shared/Style/Image/image_assets.dart';
import '../../Cubits/home_cubit.dart';
import '../../States/home_state.dart';
import '../App_head_title.dart';

class SuggestedJob extends StatelessWidget {
  const SuggestedJob({
    super.key,
    required this.image,
    required this.jobName,
    required this.companyName,
    required this.salary,
  });

  final String image;
  final String jobName;
  final String companyName;
  final String salary;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          return Container(
            height: 183,
            width: 360,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: AppColor.backgroundToggleSwitchColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Image.network(
                        image,
                        width: 40,
                        height: 40,
                      ),
                      AppHeaderTitle(
                          headerTitle: jobName,
                          colorHeaderTitle: AppColor.textButtonColorClicked,
                          fontSizeHeaderTitle: 18,
                          fontSizeSubTitle: 12,
                          colorSubTitle: AppColor.hintTextForm,
                          subTitle: companyName),
                      const Spacer(),
                      Image.asset(
                        AppImageAssets.savedImage,
                        color: AppColor.textButtonColorClicked,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      height: 30,
                      width: 87,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xff2B398D),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        homeCubit.jobType[index],
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontSize: 12,
                                  color: AppColor.textButtonColorClicked,
                                ),
                      ),
                    ),
                    itemCount: homeCubit.jobType.length,
                  ),
                ),

/*          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30,
                  width: 87,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xff2B398D),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'Fulltime',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 12,
                          color: AppColor.textButtonColorClicked,
                        ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 87,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xff2B398D),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'Remote',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 12,
                          color: AppColor.textButtonColorClicked,
                        ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 87,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xff2B398D),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'Design',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 12,
                          color: AppColor.textButtonColorClicked,
                        ),
                  ),
                ),
              ],
            ),
          ),*/
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "\$$salary",
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: AppColor.textButtonColorClicked,
                                  fontSize: 25,
                                ),
                      ),
                      Text(
                        "/Month",
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontSize: 12,
                                  color: AppColor.hintTextForm,
                                ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ButtonComponents(
                          padding: const EdgeInsets.all(4),
                          borderColor: AppColor.primaryColor,
                          buttonText: 'Apply now',
                          height: 32,
                          width: 96,
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}

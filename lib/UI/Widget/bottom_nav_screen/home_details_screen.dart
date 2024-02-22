import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_bsque/Shared/Components/button_components.dart';
import 'package:j_bsque/Shared/Style/Color/color.dart';
import 'package:j_bsque/Shared/Style/Image/image_assets.dart';
import 'package:j_bsque/UI/Cubits/home_cubit.dart';
import 'package:j_bsque/UI/States/home_state.dart';
import 'package:j_bsque/UI/Widget/App_head_title.dart';

import '../../../Shared/Components/text_form_components.dart';
import '../../../Shared/network/remote/API/dio_consumer.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(api: DioConsumer(dio: Dio()))..getProfile(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          return ConditionalBuilder(
              condition: state is! HomeGetUserLoadingState,
              builder: (context) => SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: AppHeaderTitle(
                                  headerTitle: 'Hi, ${homeCubit.userName}👋',
                                  subTitle:
                                      'Create a better future for yourself here'),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: CircleAvatar(
                                  radius: 26,
                                  backgroundColor: AppColor.borderTextForm,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor:
                                        AppColor.backgroundContainer,
                                    child: ImageIcon(AssetImage(
                                        AppImageAssets.notificationImage)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: TextFormComponents(
                            hintText: 'Search....',
                            prefixIcon: ImageIcon(
                                AssetImage(AppImageAssets.searchImage)),
                            radius: 100,
                            maxHeight: 48,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: Row(
                            children: [
                              Text(
                                'Suggested Job',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                      fontSize: 18,
                                    ),
                              ),
                              Spacer(),
                              Text(
                                'View all',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                        fontSize: 14,
                                        color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 183,
                          width: 300,
                          margin: EdgeInsets.symmetric(horizontal: 24),
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
                                    Image.asset(AppImageAssets.zoomLogoImage),
                                    AppHeaderTitle(
                                        headerTitle: 'Product Designer',
                                        colorHeaderTitle:
                                            AppColor.textButtonColorClicked,
                                        fontSizeHeaderTitle: 18,
                                        fontSizeSubTitle: 12,
                                        colorSubTitle: AppColor.hintTextForm,
                                        subTitle: 'Zoom • United States'),
                                    Spacer(),
                                    Image.asset(
                                      AppImageAssets.savedImage,
                                      color: AppColor.textButtonColorClicked,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 87,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(0xff2B398D),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Text(
                                        'Fulltime',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                              fontSize: 12,
                                              color: AppColor
                                                  .textButtonColorClicked,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 87,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(0xff2B398D),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Text(
                                        'Remote',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                              fontSize: 12,
                                              color: AppColor
                                                  .textButtonColorClicked,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 87,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(0xff2B398D),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Text(
                                        'Design',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                              fontSize: 12,
                                              color: AppColor
                                                  .textButtonColorClicked,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "\$12K-15K",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge
                                          ?.copyWith(
                                            color:
                                                AppColor.textButtonColorClicked,
                                            fontSize: 25,
                                          ),
                                    ),
                                    Text(
                                      "/Month",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge
                                          ?.copyWith(
                                            fontSize: 12,
                                            color: AppColor.hintTextForm,
                                          ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: ButtonComponents(
                                        padding: EdgeInsets.all(4),
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
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: Row(
                            children: [
                              Text(
                                'Recent Job',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                      fontSize: 18,
                                    ),
                              ),
                              Spacer(),
                              Text(
                                'View all',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                        fontSize: 14,
                                        color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                children: [
                                  Image.asset(AppImageAssets.zoomLogoImage),
                                  AppHeaderTitle(
                                      headerTitle: 'Product Designer',
                                      fontSizeHeaderTitle: 18,
                                      fontSizeSubTitle: 12,
                                      subTitle: 'Zoom • United States'),
                                  Spacer(),
                                  Image.asset(
                                    AppImageAssets.savedImage,
                                    color: AppColor.hintTextForm,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 87,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColor.backgroundContainerClicked,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Text(
                                      'Fulltime',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            fontSize: 12,
                                            color: AppColor.primaryColor,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 87,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColor.backgroundContainerClicked,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Text(
                                      'Remote',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            fontSize: 12,
                                            color: AppColor.primaryColor,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 87,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColor.backgroundContainerClicked,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Text(
                                      'Design',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            fontSize: 12,
                                            color: AppColor.primaryColor,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    "\$15K",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(
                                          color: AppColor.textGreenColor,
                                          fontSize: 16,
                                        ),
                                  ),
                                  Text(
                                    "/Month",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(
                                          fontSize: 12,
                                          color: AppColor.hintTextForm,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Divider(
                                color: AppColor.hintTextForm,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
              fallback: (context) => Center(
                    child: CircularProgressIndicator(),
                  ));
        },
      ),
    );
  }
}

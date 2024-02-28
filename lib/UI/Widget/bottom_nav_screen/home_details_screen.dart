import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_bsque/Shared/Constant/constant.dart';
import 'package:j_bsque/Shared/Style/Color/color.dart';
import 'package:j_bsque/Shared/Style/Image/image_assets.dart';
import 'package:j_bsque/UI/Cubits/home_cubit.dart';
import 'package:j_bsque/UI/States/home_state.dart';
import 'package:j_bsque/UI/Widget/App_head_title.dart';

import '../../../Shared/Components/text_form_components.dart';
import '../../../Shared/network/remote/API/dio_consumer.dart';
import '../home/header_home.dart';
import '../home/suggested_job.dart';
import '../home/view_details.dart';

class HomeDetailsScreen extends StatelessWidget {
  HomeDetailsScreen({super.key});

  late String error;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(api: DioConsumer(dio: Dio()))
        ..getSuggestedJob()
        ..getProfile(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetSuggestedJobErrorState) {
            error = state.error;
          }
        },
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ConditionalBuilder(
                    condition: state is! HomeGetUserLoadingState,
                    builder: (context) => HeaderHome(
                          userName: homeCubit.userName!,
                        ),
                    fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        )),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: TextFormComponents(
                    hintText: 'Search....',
                    prefixIcon:
                        ImageIcon(AssetImage(AppImageAssets.searchImage)),
                    radius: 100,
                    maxHeight: 48,
                  ),
                ),
                const ViewDetails(
                  title: 'Suggested Job',
                ),
                ConditionalBuilder(
                  condition: state is! HomeGetSuggestedJobErrorState,
                  builder: (context) => SizedBox(
                    height: 183,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => SuggestedJob(
                        image: homeCubit.suggestedJob[index]
                            [APIConstantData.image],
                        jobName: homeCubit.suggestedJob[index]
                            [APIConstantData.name],
                        companyName: homeCubit.suggestedJob[index]
                            [APIConstantData.companyName],
                        salary: homeCubit.suggestedJob[index]
                            [APIConstantData.salary],
                      ),
                      itemCount: homeCubit.suggestedJob.length,
                    ),
                  ),
                  fallback: (context) => Center(
                    child: Text(
                      error,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ),
                const ViewDetails(
                  title: 'Recent Job',
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
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 87,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColor.backgroundContainerClicked,
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
                              color: AppColor.backgroundContainerClicked,
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
                              color: AppColor.backgroundContainerClicked,
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
          );
        },
      ),
    );
  }
}

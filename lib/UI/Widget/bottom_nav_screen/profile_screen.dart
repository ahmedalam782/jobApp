import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Shared/Constant/constant.dart';
import '../../../Shared/network/remote/API/dio_consumer.dart';
import '../../Cubits/profile_cubit.dart';
import '../../States/profile_state.dart';
import '../App_head_title.dart';
import '../container_header_app.dart';
import '../profile/about_profile.dart';
import '../profile/content_list_view.dart';
import '../profile/header_profile.dart';
import '../profile/row_container_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        api: DioConsumer(dio: Dio()),
      )..getEditProfile(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ProfileCubit profileCubit = ProfileCubit.get(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  const HeaderProfile(),
                  AppHeaderTitle(
                    headerTitle: profileCubit.name.text,
                    fontSizeHeaderTitle: 20,
                    subTitle: profileCubit.bio.text,
                    fontSizeSubTitle: 14,
                  ),
                  const RowContainerList(),
                  const AboutProfile(),
                  const SizedBox(
                    height: 20,
                  ),
                  const ContainerHeaderApp(
                    title: 'General',
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ContentListView(
                      title: ConstantData.generalProfile[index].title,
                      image: ConstantData.generalProfile[index].image!,
                      routeName: ConstantData.generalProfile[index].routeName,
                    ),
                    itemCount: ConstantData.generalProfile.length,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ContainerHeaderApp(
                    title: 'Others',
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ContentListView(
                      title: ConstantData.otherProfile[index].title,
                      routeName: ConstantData.otherProfile[index].routeName,
                    ),
                    itemCount: ConstantData.otherProfile.length,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            );
          }),
    );
  }
}

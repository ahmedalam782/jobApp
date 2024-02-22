import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_bsque/Shared/network/remote/API/dio_consumer.dart';
import 'package:j_bsque/UI/Cubits/profile_cubit.dart';
import 'package:j_bsque/UI/States/profile_state.dart';

import '../../Shared/Components/text_form_components.dart';
import '../../Shared/Style/Image/image_assets.dart';
import '../Widget/help_center/content_list_view.dart';
import '../Widget/help_center/content_list_view_when_pressed.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  static const String routeName = 'HelpCenter';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(api: DioConsumer(dio: Dio())),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (BuildContext context, ProfileStates state) {},
        builder: (BuildContext context, ProfileStates state) {
          ProfileCubit profileCubit = ProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(
                  'Help Center ',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 20,
                      ),
                ),
              ),
            ),
            body: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: TextFormComponents(
                    hintText: 'What can we help?',
                    prefixIcon:
                        ImageIcon(AssetImage(AppImageAssets.searchImage)),
                    radius: 100,
                    maxHeight: 48,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                        profileCubit.isSelected[index] != null
                            ? ContentListViewHelpCenterWhenPressed(
                                onTap: () =>
                                    profileCubit.getContentHelpAppear(index),
                              )
                            : ContentListViewHelpCenter(
                                onTap: () =>
                                    profileCubit.getContentHelpAppear(index),
                              ),
                    itemCount: 10,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Shared/Style/Image/image_assets.dart';
import '../../Cubits/profile_cubit.dart';
import '../../States/profile_state.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ProfileCubit profileCubit = ProfileCubit.get(context);
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 40),
                height: 195,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        AppImageAssets.profileBackgroundImage,
                      ),
                      fit: BoxFit.fill),
                  // color: Color(0xffD7E3FF),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 80.0, left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.arrow_back,
                      ),
                      Text(
                        'Profile',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontSize: 20),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Image.asset(
                            AppImageAssets.logoutImage,
                          )),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    child: CircleAvatar(
                      radius: 42.0,
                      backgroundColor: Colors.white,
                      child: ConditionalBuilder(
                          condition: state is! GetProfileDataLoadingState,
                          builder: (BuildContext context) => CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    NetworkImage(profileCubit.profilePicture!),
                              ),
                          fallback: (context) => const Center(
                                child: CircularProgressIndicator(),
                              )),
                    ),
                  )),
            ],
          );
        });
  }
}

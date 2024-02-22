import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:j_bsque/UI/States/profile_state.dart';

import '../../../Shared/Style/Image/image_assets.dart';
import '../../Cubits/profile_cubit.dart';

class PickImageDesign extends StatelessWidget {
  const PickImageDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ProfileCubit profileCubit = ProfileCubit.get(context);
        return Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: profileCubit.profilePic != null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              FileImage(File(profileCubit.profilePic!.path)),
                        )
                      : ConditionalBuilder(
                          condition: state is! GetProfileDataLoadingState,
                          builder: (BuildContext context) => CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(profileCubit.profilePicture!),
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                ),
                Image.asset(AppImageAssets.cameraImage),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  ImagePicker().pickImage(source: ImageSource.gallery).then(
                        (value) => profileCubit.uploadProfilePicture(value!),
                      );
                },
                child: Text('Change  Photo',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        )),
              ),
            ),
          ],
        );
      },
    );
  }
}

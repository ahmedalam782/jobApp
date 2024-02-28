import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:j_bsque/Shared/network/remote/API/dio_consumer.dart';

import '../../Shared/Components/button_components.dart';
import '../../Shared/Constant/constant.dart';
import '../../Shared/Style/Color/color.dart';
import '../Cubits/profile_cubit.dart';
import '../States/profile_state.dart';
import '../Widget/edit_profile/pick_image.dart';
import '../Widget/edit_profile/profile_data_entry.dart';

class EditProfile extends StatelessWidget {
  static const String routeName = 'EditProfile';

  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(api: DioConsumer(dio: Dio()))..getEditProfile(),
      child:
          BlocConsumer<ProfileCubit, ProfileStates>(listener: (context, state) {
        if (ProfileCubit.get(context).profilePic == null &&
            ProfileCubit.get(context).profilePicture == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('you must choose image'),
            ),
          );
        } else if (state is EditProfileSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile Data Saved'),
            ),
          );
        } else if (state is EditProfileErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      }, builder: (context, state) {
        ProfileCubit profileCubit = ProfileCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Center(
              child: Text(
                'Personal Details',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 20,
                    ),
              ),
            ),
          ),
          body: Form(
            key: profileCubit.editProfileFormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PickImageDesign(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => EditProfileData(
                      title: ConstantData.editProfileDataModel[index].title,
                      controller:
                          ConstantData.editProfileDataModel[index].controller,
                      validator: (value) => profileCubit.validAllForm(value,
                          ConstantData.editProfileDataModel[index].title),
                      onFieldSubmitted: profileCubit.onSubmitForm,
                    ),
                    itemCount: ConstantData.editProfileDataModel.length,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 5),
                    child: Text('No.Headphone',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                fontSize: 16, color: AppColor.hintTextForm)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: IntlPhoneField(
                      flagsButtonMargin: const EdgeInsets.all(16),
                      dropdownIconPosition: IconPosition.trailing,
                      controller: profileCubit.telephone,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              width: 1,
                              color: AppColor.borderTextForm,
                            ),
                          )),
                      initialCountryCode: 'EG',
                    ),
                  ),
                  ConditionalBuilder(
                    condition: state is! EditProfileLoadingState,
                    builder: (BuildContext context) => Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: ButtonComponents(
                          buttonText: 'Save',
                          onPressed: profileCubit.updateProfileData,
                        ),
                      ),
                    ),
                    fallback: (BuildContext context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

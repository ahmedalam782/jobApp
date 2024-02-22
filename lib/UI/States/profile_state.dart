abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class EditProfileLoadingState extends ProfileStates {}

class EditProfileSuccessState extends ProfileStates {}

class EditProfileErrorState extends ProfileStates {
  final String error;

  EditProfileErrorState(this.error);
}

class ProfileValidAllFormState extends ProfileStates {}

class ProfileOnFieldSubmittedState extends ProfileStates {}

class ProfileUploadProfilePictureState extends ProfileStates {}

class GetProfileDataLoadingState extends ProfileStates {}

class GetProfileDataSuccessState extends ProfileStates {}

class GetProfileDataErrorState extends ProfileStates {
  final String error;

  GetProfileDataErrorState(this.error);
}

class HelpCenterOpenContainerContent extends ProfileStates {}

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginPasswordVisibilityState extends LoginStates {}

class LoginValidAllFormState extends LoginStates {}

class LoginValidateEmailState extends LoginStates {}

class LoginValidatePasswordState extends LoginStates {}

class LoginOnFieldSubmittedState extends LoginStates {}

class LoginSignInState extends LoginStates {}

class LoginRememberMeState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}

class LoginGoogleLoadingState extends LoginStates {}

class LoginGoogleSuccessState extends LoginStates {}

class LoginGoogleErrorState extends LoginStates {
  final String error;

  LoginGoogleErrorState(this.error);
}

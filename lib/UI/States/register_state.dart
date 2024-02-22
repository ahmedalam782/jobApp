abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterPasswordVisibilityState extends RegisterStates {}

class RegisterValidAllFormState extends RegisterStates {}

class RegisterValidateEmailState extends RegisterStates {}

class RegisterValidatePasswordState extends RegisterStates {}

class RegisterOnFieldSubmittedState extends RegisterStates {}

class RegisterSignUpState extends RegisterStates {}

class RegisterRememberMeState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState(this.error);
}

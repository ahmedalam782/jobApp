abstract class InformationRegisterState {}

class InformationRegisterInitialState extends InformationRegisterState {}

class InformationRegisterInterestedWorkState extends InformationRegisterState {}

class InformationRegisterCountryListState extends InformationRegisterState {}

class InformationRegisterLoadingState extends InformationRegisterState {}

class InformationRegisterSuccessState extends InformationRegisterState {}

class InformationRegisterErrorState extends InformationRegisterState {
  final String error;

  InformationRegisterErrorState(this.error);
}

class InformationRegisterInterestedWorkLoadingState
    extends InformationRegisterState {}

class InformationRegisterInterestedWorkSuccessState
    extends InformationRegisterState {}

class InformationRegisterInterestedWorkErrorState
    extends InformationRegisterState {
  final String error;

  InformationRegisterInterestedWorkErrorState(this.error);
}

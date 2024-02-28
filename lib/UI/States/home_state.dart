abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeGetUserLoadingState extends HomeStates {}

class HomeGetUserSuccessState extends HomeStates {}

class HomeGetUserErrorState extends HomeStates {
  final String error;

  HomeGetUserErrorState(this.error);
}

class HomeChangeBottomNavState extends HomeStates {}

class HomeGetSuggestedJobLoadingState extends HomeStates {}

class HomeGetSuggestedJobSuccessState extends HomeStates {}

class HomeGetSuggestedJobErrorState extends HomeStates {
  final String error;

  HomeGetSuggestedJobErrorState(this.error);
}

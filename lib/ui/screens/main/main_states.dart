abstract class MainStates {}

class MainInitialState extends MainStates {}

class MainChangeBottomNavBarIndexState extends MainStates {}

class MainLoadingState extends MainStates {}

class MainSuccessState<Type> extends MainStates {
  Type data;

  MainSuccessState(this.data);
}

class MainErrorState extends MainStates {
  String errorMessage;

  MainErrorState(this.errorMessage);
}
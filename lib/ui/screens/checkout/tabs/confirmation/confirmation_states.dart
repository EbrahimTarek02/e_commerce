abstract class ConfirmationStates {}

class ConfirmationLoadingState extends ConfirmationStates {}

class ConfirmationSuccessState<Type> extends ConfirmationStates {
  Type data;

  ConfirmationSuccessState(this.data);
}

class ConfirmationErrorState extends ConfirmationStates {
  String errorMessage;

  ConfirmationErrorState(this.errorMessage);
}
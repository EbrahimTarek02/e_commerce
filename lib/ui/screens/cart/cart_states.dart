abstract class CartStates {}

class CartInitialState extends CartStates {}

class CounterState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartSuccessState extends CartStates {}

class CartErrorState extends CartStates {
  String errorMessage;

  CartErrorState(this.errorMessage);
}
abstract class PaymentStates {}

class PaymentInitialState extends PaymentStates {}

class PaymentLoadingState extends PaymentStates {}

class PaymentSuccessState extends PaymentStates {
  String data;

  PaymentSuccessState(this.data);
}

class PaymentErrorState extends PaymentStates {
  String errorMessage;

  PaymentErrorState(this.errorMessage);
}
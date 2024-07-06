abstract class OrdersStates {}

class OrdersLoadingState extends OrdersStates {}

class OrdersSuccessState<Type> extends OrdersStates {
  Type data;

  OrdersSuccessState(this.data);
}

class OrdersErrorState extends OrdersStates {
  String errorMessage;

  OrdersErrorState(this.errorMessage);
}
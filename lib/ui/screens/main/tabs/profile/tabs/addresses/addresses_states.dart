abstract class UserAddressesStates {}

class UserAddressesInitialState extends UserAddressesStates {}

class UserAddressesLoadingState extends UserAddressesStates {}

class DeleteUserAddressesLoadingState extends UserAddressesStates {}

class UserAddressesSuccessState<Type> extends UserAddressesStates {
  Type data;

  UserAddressesSuccessState(this.data);
}

class UserAddressesErrorState extends UserAddressesStates {
  String errorMessage;

  UserAddressesErrorState(this.errorMessage);
}
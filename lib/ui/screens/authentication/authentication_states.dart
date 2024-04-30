abstract class AuthenticationStates {}

class AuthenticationInitialState extends AuthenticationStates{
  bool isObscured;
  bool? isEnabled = true;

  AuthenticationInitialState({this.isEnabled, required this.isObscured});
}

class AuthenticationLoadingState extends AuthenticationStates{}

class AuthenticationSuccessState extends AuthenticationStates{}

class AuthenticationErrorState extends AuthenticationStates{
  String errorMessage;

  AuthenticationErrorState(this.errorMessage);
}

class VerifySentCodeLoadingState extends AuthenticationStates{}

class VerifySentCodeSuccessState extends AuthenticationStates{}
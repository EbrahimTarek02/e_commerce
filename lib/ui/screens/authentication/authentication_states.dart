abstract class AuthenticationStates {}

class AuthenticationInitialState extends AuthenticationStates{
  bool isObscured;

  AuthenticationInitialState({required this.isObscured});
}
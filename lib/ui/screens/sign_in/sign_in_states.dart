abstract class SignInStates{}

class InitialState extends SignInStates{
  bool isObscured;

  InitialState(this.isObscured);
}
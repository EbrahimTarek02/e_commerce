import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:e_commerce/domain/use_cases/authentication_use_cases/sign_in_use_case.dart';
import 'package:e_commerce/ui/screens/authentication/authentication_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInViewModel extends Cubit<AuthenticationStates> {
  SignInUseCase signInUseCase;

  SignInViewModel(this.signInUseCase) : super(AuthenticationInitialState(isObscured: true));

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String? validateEmail() {
    if (email.text.isEmpty){
      return "Please Enter Your Email";
    }

    if (! RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
    ).hasMatch(email.text)
    ){
      return "Please Enter an Email";
    }
    return null;
  }

  String? validatePassword() {
    if (password.text.isEmpty){
      return "Please Enter Your Password";
    }

    if (password.text.length < 8){
      return "Password Must Be At Least 8 Characters";
    }
    return null;
  }

  bool isObscured = true;
  void changePasswordVisibility() {
    isObscured = ! isObscured;
    emit(AuthenticationInitialState(isObscured: isObscured));
  }

  Future<void> signIn() async{
    if (!formKey.currentState!.validate()) return;

    emit(AuthenticationLoadingState());

    Either<String, AuthenticationResponse> response = await signInUseCase.execute(email.text, password.text);

    response.fold((error) {
      emit(AuthenticationErrorState(error.toString()));
    }, (success) {
      emit(AuthenticationSuccessState());
    });
  }
}
import 'package:e_commerce/ui/screens/sign_in/sign_in_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewModel extends Cubit<SignInStates> {
  SignInViewModel() : super(InitialState(true));

  GlobalKey<FormState> formKey = GlobalKey();

  String? validateEmail(inputText) {
    if (inputText == null || inputText.isEmpty){
      return "Please Enter Your Email";
    }

    else if (! RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
    ).hasMatch(inputText)
    ){
      return "Please Enter an Email";
    }
    return null;
  }

  String? validatePassword(inputText) {
    if (inputText == null || inputText.isEmpty){
      return "Please Enter Your Password";
    }
    return null;
  }

  bool isObscured = true;

  void changePasswordVisibility() {
    isObscured = ! isObscured;
    emit(InitialState(isObscured));
  }

}
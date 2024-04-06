import 'package:e_commerce/ui/screens/authentication/authentication_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationViewModel extends Cubit<AuthenticationStates>{
  AuthenticationViewModel() : super(AuthenticationInitialState(isObscured: true));

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();

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

  String? validateFullName() {
   if (fullName.text.isEmpty){
     return "Please Enter Your Full Name";
   }

   return null;
  }

  String? validatePhoneNumber() {
    if (phoneNumber.text.isEmpty){
      return "Please Enter Your Phone Number";
    }

    return null;
  }

  String? validatePasswordConfirmation() {
    if (passwordConfirmation.text.isEmpty){
      return "Please Enter Your Password";
    }

    if (passwordConfirmation.text.length < 8){
      return "Password Must Be At Least 8 Characters";
    }

    if (password.text != passwordConfirmation.text){
      return "Password Doesn't match";
    }
    return null;
  }

  bool isObscured = true;
  void changePasswordVisibility() {
    isObscured = ! isObscured;
    emit(AuthenticationInitialState(isObscured: isObscured));
  }
}
import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:e_commerce/domain/use_cases/authentication_use_cases/sign_up_use_case.dart';
import 'package:e_commerce/ui/screens/authentication/authentication_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpViewModel extends Cubit<AuthenticationStates>{
  SignUpUseCase signUpUseCase;

  SignUpViewModel(this.signUpUseCase) : super(AuthenticationInitialState(isObscured: true));

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

  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) return;

    emit(AuthenticationLoadingState());

    Either<String, AuthenticationResponse> response = await signUpUseCase.execute(fullName.text, phoneNumber.text, email.text, password.text, passwordConfirmation.text);

    response.fold((error) {
      emit(AuthenticationErrorState(error.toString()));
    }, (success) {
      emit(AuthenticationSuccessState());
    });
  }
}
import 'package:e_commerce/domain/use_cases/authentication_use_cases/forgot_password_use_cases/verify_email_use_case.dart';
import 'package:e_commerce/ui/screens/authentication/authentication_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyEmailViewModel extends Cubit<AuthenticationStates>{
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController email = TextEditingController();
  VerifyEmailUseCase verifyEmailUseCase;

  VerifyEmailViewModel(this.verifyEmailUseCase) : super(AuthenticationInitialState(isObscured: true));

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

  void verifyEmail() async{
    if (!formKey.currentState!.validate()) return;

    emit(AuthenticationLoadingState());

    Either<String, bool> response = await verifyEmailUseCase.execute(email.text);

    response.fold((error) {
      emit(AuthenticationErrorState(error));
    }, (success) {
      emit(AuthenticationSuccessState());
    });
  }
}
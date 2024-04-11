import 'package:e_commerce/domain/use_cases/authentication_use_cases/forgot_password_use_cases/verify_email_use_case.dart';
import 'package:e_commerce/domain/use_cases/authentication_use_cases/forgot_password_use_cases/verify_sent_code_use_case.dart';
import 'package:e_commerce/ui/screens/authentication/authentication_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifySentCodeViewModel extends Cubit<AuthenticationStates>{
  VerifySentCodeViewModel(this.verifyEmailUseCase, this.verifySentCodeUseCase) : super(AuthenticationInitialState(isObscured: true));

  VerifyEmailUseCase verifyEmailUseCase;
  VerifySentCodeUseCase verifySentCodeUseCase;
  TextEditingController number1 = TextEditingController();
  TextEditingController number2 = TextEditingController();
  TextEditingController number3 = TextEditingController();
  TextEditingController number4 = TextEditingController();
  TextEditingController number5 = TextEditingController();
  TextEditingController number6 = TextEditingController();

  void verifySentCode() async{
    emit(VerifySentCodeLoadingState());

    String code = number1.text + number2.text + number3.text + number4.text + number5.text + number6.text;

    Either<String, bool> response = await verifySentCodeUseCase.execute(code);

    response.fold((error) {
      emit(AuthenticationErrorState(error));
    }, (success) {
      emit(VerifySentCodeSuccessState());
    });
  }

  void verifyEmail(String email) async{
    emit(AuthenticationLoadingState());

    Either<String, bool> response = await verifyEmailUseCase.execute(email);

    response.fold((error) {
      emit(AuthenticationErrorState(error));
    }, (success) {
      emit(AuthenticationSuccessState());
    });
  }

}
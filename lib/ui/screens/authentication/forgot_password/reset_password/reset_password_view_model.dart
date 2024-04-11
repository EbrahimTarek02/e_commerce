import 'package:e_commerce/domain/use_cases/authentication_use_cases/forgot_password_use_cases/reset_password_use_case.dart';
import 'package:e_commerce/ui/screens/authentication/authentication_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordViewModel extends Cubit<AuthenticationStates>{
  ResetPasswordViewModel(this.resetPasswordUseCase) : super(AuthenticationInitialState(isObscured: true));

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController newPassword = TextEditingController();

  ResetPasswordUseCase resetPasswordUseCase;

  String? validatePassword() {
    if (newPassword.text.isEmpty){
      return "Please Enter Your Password";
    }

    if (newPassword.text.length < 8){
      return "Password Must Be At Least 8 Characters";
    }
    return null;
  }

  bool isObscured = true;
  void changePasswordVisibility() {
    isObscured = ! isObscured;
    emit(AuthenticationInitialState(isObscured: isObscured));
  }

  void resetPassword(String email) async{
    if (!formKey.currentState!.validate()) return;

    emit(AuthenticationLoadingState());

    Either<String, bool> response = await resetPasswordUseCase.execute(email, newPassword.text);

    response.fold((error) {
      emit(AuthenticationErrorState(error));
    }, (success) {
      emit(AuthenticationSuccessState());
    });
  }
}
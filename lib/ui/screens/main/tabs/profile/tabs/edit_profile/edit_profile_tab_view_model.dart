import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:e_commerce/data/utils/shared_prefs_utils.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/domain/use_cases/authentication_use_cases/edit_profile_use_case.dart';
import 'package:e_commerce/ui/screens/authentication/authentication_states.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/profile_tab_view_model.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileTabViewModel extends Cubit<AuthenticationStates>{
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController fullName = TextEditingController(text: ProfileTabViewModel.user.name);
  TextEditingController email = TextEditingController(text: ProfileTabViewModel.user.email);
  TextEditingController password = TextEditingController(text: ProfileTabViewModel.user.password);
  TextEditingController passwordConfirmation = TextEditingController(text: ProfileTabViewModel.user.password);
  EditProfileUseCase editProfileUseCase;

  EditProfileTabViewModel(this.editProfileUseCase) : super(AuthenticationInitialState(isObscured: false, isEnabled: false));

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

  bool isEnabled = false;
  void changeTextFormFieldState() async{
    if (!isEnabled){
      isEnabled = ! isEnabled;
      emit(AuthenticationInitialState(isObscured: isObscured, isEnabled: isEnabled));
    }
    else {
      if (!formKey.currentState!.validate()) return;
      emit(AuthenticationLoadingState());
      Either<String, AuthenticationResponse> editProfileResponse = await editProfileUseCase.executeEditProfile(fullName.text, email.text, ProfileTabViewModel.token);
      editProfileResponse.fold((error) {
        emit(AuthenticationErrorState(error));
      }, (_) async{
        Either<String, AuthenticationResponse> editPasswordResponse = await editProfileUseCase.executeEditPassword(ProfileTabViewModel.user.password!, password.text, passwordConfirmation.text, ProfileTabViewModel.token);
        editPasswordResponse.fold((error) {
          emit(AuthenticationErrorState(error));
        }, (success){
          SharedPrefsUtils sharedPrefsUtils = getIt<SharedPrefsUtils>();
          User user = User(
              name: fullName.text,
              email: email.text,
              password: password.text,
              role: "user"
          );

          sharedPrefsUtils.setUser(user);
          sharedPrefsUtils.setToken(success.token!);

          ProfileTabViewModel.user = user;
          ProfileTabViewModel.token = success.token!;

          isEnabled = ! isEnabled;
          isObscured = true;
          emit(AuthenticationInitialState(isObscured: isObscured, isEnabled: isEnabled));
        });
      });
    }

  }
}
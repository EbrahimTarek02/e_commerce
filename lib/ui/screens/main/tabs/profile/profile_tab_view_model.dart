import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:e_commerce/data/utils/shared_prefs_utils.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileTabViewModel {
  static User user = User();
  static String token = "";

  SharedPrefsUtils sharedPrefsUtils = getIt<SharedPrefsUtils>();

  void getUser() async{
    user = (await sharedPrefsUtils.getUser())!;
    token = (await sharedPrefsUtils.getToken())!;
  }

  void logout(BuildContext context) {
    sharedPrefsUtils.deleteUser();
    Navigator.pushNamedAndRemoveUntil(context, SignInScreen.routeName, (Route<dynamic> route) => false);
  }
}
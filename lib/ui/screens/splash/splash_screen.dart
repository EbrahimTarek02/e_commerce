import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:e_commerce/data/utils/shared_prefs_utils.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:e_commerce/ui/screens/main/main_screen.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  static const String routeName = 'splash screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
        () async {
        SharedPrefsUtils sharedPrefsUtils = getIt<SharedPrefsUtils>();
        User? user = await sharedPrefsUtils.getUser();
        String? token = await sharedPrefsUtils.getToken();
        if (user != null && token != null) {
          if (!mounted) return;
          Navigator.pushNamedAndRemoveUntil(context, MainScreen.routeName, (Route<dynamic> route) => false);
        }
        else {
          if (!mounted) return;
          Navigator.pushNamedAndRemoveUntil(context, SignInScreen.routeName, (Route<dynamic> route) => false);
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.splashScreenImage,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}

import 'package:e_commerce/ui/screens/sign_in/sign_in_screen.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  static const String routeName = 'splash screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      ()=> Navigator.pushReplacementNamed(context, SignInScreen.routeName)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.splashScreenImage,
      fit: BoxFit.cover,
    );
  }
}

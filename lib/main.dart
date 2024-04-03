import 'package:e_commerce/ui/screens/sign_in/sign_in_screen.dart';
import 'package:e_commerce/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (_) => SplashScreen(),
        SignInScreen.routeName : (_) => SignInScreen()
      },
    );
  }
}

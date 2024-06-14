import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/all_products/all_products_screen.dart';
import 'package:e_commerce/ui/screens/authentication/forgot_password/reset_password/reset_password_screen.dart';
import 'package:e_commerce/ui/screens/authentication/forgot_password/verify_email/verify_email_screen.dart';
import 'package:e_commerce/ui/screens/authentication/forgot_password/verify_sent_code/verify_sent_code_screen.dart';
import 'package:e_commerce/ui/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:e_commerce/ui/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:e_commerce/ui/screens/cart/cart_screen.dart';
import 'package:e_commerce/ui/screens/cart/cart_view_model.dart';
import 'package:e_commerce/ui/screens/main/main_screen.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/edit_profile/edit_profile_tab.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_screen.dart';
import 'package:e_commerce/ui/screens/products_of_category/products_of_category_screen.dart';
import 'package:e_commerce/ui/screens/splash/splash_screen.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<MainViewModel>(),
        ),
        BlocProvider(
          create: (context) => getIt<CartViewModel>(),
        ),
      ],
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),

      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (_) => const SplashScreen(),
        SignInScreen.routeName : (_) => SignInScreen(),
        SignUpScreen.routeName : (_) => SignUpScreen(),
        VerifyEmailScreen.routeName : (_) => VerifyEmailScreen(),
        VerifySentCodeScreen.routeName : (_) => VerifySentCodeScreen(),
        ResetPasswordScreen.routeName : (_) => ResetPasswordScreen(),
        MainScreen.routeName : (_) => const MainScreen(),
        EditProfileTab.routeName : (_) => EditProfileTab(),
        ProductDetailsScreen.routeName : (_) => const ProductDetailsScreen(),
        ProductsOfCategoryScreen.routeName : (_) => const ProductsOfCategoryScreen(),
        AllProductsScreen.routeName : (_) => const AllProductsScreen(),
        CartScreen.routeName : (_) => const CartScreen()
      },
    );
  }
}

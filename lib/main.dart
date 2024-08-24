import 'package:device_preview/device_preview.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/add_new_address_manually/add_new_address_manually_screen.dart';
import 'package:e_commerce/ui/screens/add_new_address_using_map/add_new_address_using_map_screen.dart';
import 'package:e_commerce/ui/screens/all_products/all_products_screen.dart';
import 'package:e_commerce/ui/screens/authentication/forgot_password/reset_password/reset_password_screen.dart';
import 'package:e_commerce/ui/screens/authentication/forgot_password/verify_email/verify_email_screen.dart';
import 'package:e_commerce/ui/screens/authentication/forgot_password/verify_sent_code/verify_sent_code_screen.dart';
import 'package:e_commerce/ui/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:e_commerce/ui/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:e_commerce/ui/screens/cart/cart_screen.dart';
import 'package:e_commerce/ui/screens/cart/cart_view_model.dart';
import 'package:e_commerce/ui/screens/checkout/checkout_screen.dart';
import 'package:e_commerce/ui/screens/main/main_screen.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/addresses/addresses_tab.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/edit_profile/edit_profile_tab.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/orders/orders_tab.dart';
import 'package:e_commerce/ui/screens/order_details/order_details_screen.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_screen.dart';
import 'package:e_commerce/ui/screens/products_of_category/products_of_category_screen.dart';
import 'package:e_commerce/ui/screens/splash/splash_screen.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<MainViewModel>(),
          ),
          BlocProvider(
            create: (context) => getIt<CartViewModel>(),
          ),
        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: AppColors.white
        ),
        scaffoldBackgroundColor: AppColors.white
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
        CartScreen.routeName : (_) => const CartScreen(),
        AddressesTab.routeName : (_) => const AddressesTab(),
        AddNewAddressManually.routeName : (_) => const AddNewAddressManually(),
        AddNewAddressUsingMap.routeName : (_) => const AddNewAddressUsingMap(),
        OrdersTab.routeName : (_) => const OrdersTab(),
        CheckoutScreen.routeName : (_) => const CheckoutScreen(),
        OrderDetailsScreen.routeName : (_) => OrderDetailsScreen(),
      },
    );
  }
}

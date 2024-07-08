import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:e_commerce/data/utils/shared_prefs_utils.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:e_commerce/ui/screens/main/main_screen.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {

  static const String routeName = 'splash screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(
          Duration.zero,
            () async {
          SharedPrefsUtils sharedPrefsUtils = getIt<SharedPrefsUtils>();
          User? user = await sharedPrefsUtils.getUser();
          String? token = await sharedPrefsUtils.getToken();
          if (user != null && token != null) {
            if (!mounted) return;
            MainViewModel mainViewModel = BlocProvider.of(context);
            await mainViewModel.getCart().then((_) async{
              await mainViewModel.getWishList().then((__) async{
                await mainViewModel.getAllProducts();
                await mainViewModel.getAllCategories();
                await mainViewModel.getAllBrands();
              });
            });
            if (!mounted) return;
            Navigator.pushNamedAndRemoveUntil(context, MainScreen.routeName, (Route<dynamic> route) => false);
          }
          else {
            if (!mounted) return;
            Future.delayed(const Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, SignInScreen.routeName, (Route<dynamic> route) => false));
          }
        }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          AppAssets.splashScreenImage,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.6),
          child: const CircularProgressIndicator(color: AppColors.white,),
        )
      ],
    );
  }
}

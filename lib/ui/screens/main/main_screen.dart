import 'package:e_commerce/ui/screens/cart/cart_screen.dart';
import 'package:e_commerce/ui/screens/main/custom_bottom_nav_bar.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/screens/main/tabs/brands/brands_tab.dart';
import 'package:e_commerce/ui/screens/main/tabs/home/home_tab.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/profile_tab.dart';
import 'package:e_commerce/ui/screens/main/tabs/wish_list/wish_list_tab.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "Home Screen";

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainViewModel mainViewModel;

  List<Widget> screens = [
    const HomeTab(),
    const BrandsTab(),
    const WishListTab(),
    const ProfileTab()
  ];

  @override
  void initState() {
    mainViewModel = BlocProvider.of(context);
    mainViewModel.changeBottomNavBarIndex(0);
    mainViewModel.prepareAppDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MainViewModel, MainStates>(
        bloc: mainViewModel,
        builder: (context, state) {
          return Scaffold(

              backgroundColor: AppColors.white,

              appBar: AppBar(
                title: Image.asset(
                  AppAssets.appLogoBlue,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                actions: [
                  IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, CartScreen.routeName);
                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColors.primaryColor,
                        size: 26,
                      )
                  )
                ],
              ),

              body: screens[mainViewModel.currentIndex],

              bottomNavigationBar: CustomBottomNavBar(mainViewModel)
          );
        }
    );
  }
}

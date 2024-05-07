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
  late MainViewModel viewModel;

  List<Widget> screens = [
    const HomeTab(),
    const BrandsTab(),
    const WishListTab(),
    const ProfileTab()
  ];

  @override
  void initState() {
    viewModel = BlocProvider.of(context);
    viewModel.getWishList().then((_) {
      viewModel.getAllProducts();
      viewModel.getAllCategories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<MainViewModel, MainStates>(
          bloc: viewModel,
          builder: (context, state) {
            return Scaffold(

                backgroundColor: AppColors.white,

                appBar: AppBar(
                  backgroundColor: AppColors.white,

                  title: Image.asset(
                    AppAssets.appLogoBlue,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.037,
                  ),
                  actions: [
                    IconButton(
                        onPressed: (){
                          // Navigate to cart screen
                        },
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColors.primaryColor,
                          size: 30,
                        )
                    )
                  ],
                ),

                body: screens[viewModel.currentIndex],

                bottomNavigationBar: CustomBottomNavBar(viewModel)
            );
          }
      ),
    );
  }
}

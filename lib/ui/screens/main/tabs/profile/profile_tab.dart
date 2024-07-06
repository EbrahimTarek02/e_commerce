import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/profile_tab_view_model.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/addresses/addresses_tab.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/edit_profile/edit_profile_tab.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/orders/orders_tab.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {

  late ProfileTabViewModel viewModel;
  late MainViewModel mainViewModel;

  @override
  void initState() {
    viewModel = getIt<ProfileTabViewModel>();
    mainViewModel = BlocProvider.of(context);
    viewModel.getUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: (){
              Navigator.pushNamed(context, EditProfileTab.routeName);
            },
            child: Row(
              children: [
                const Icon(Icons.person_outline),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.03,),
                Text(
                  "Profile",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios),
              ],
            )
          ),
          TextButton(
              onPressed: (){
                Navigator.pushNamed(context, AddressesTab.routeName);
              },
              child: Row(
                children: [
                  const Icon(Icons.home_outlined),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.03,),
                  Text(
                    "Addresses",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios),
                ],
              )
          ),
          TextButton(
              onPressed: (){
                Navigator.pushNamed(context, OrdersTab.routeName);
              },
              child: Row(
                children: [
                  const Icon(Icons.shopping_bag_outlined),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.03,),
                  Text(
                    "Orders",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios),
                ],
              )
          ),
          TextButton(
              onPressed: (){
                viewModel.logout(context);
              },
              child: Row(
                children: [
                  const Icon(Icons.logout),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.03,),
                  Text(
                    "Logout",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}

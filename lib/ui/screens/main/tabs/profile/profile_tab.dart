import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/profile_tab_view_model.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/edit_profile/edit_profile_tab.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {

  late ProfileTabViewModel viewModel;

  @override
  void initState() {
    viewModel = getIt<ProfileTabViewModel>();
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
              style: ElevatedButton.styleFrom(
                alignment: AlignmentDirectional.centerStart,
              ),
            child: Text(
              "Profile",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            )
          ),
          TextButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                alignment: AlignmentDirectional.centerStart,
              ),
              child: Text(
                "Orders",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              )
          ),
          TextButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                alignment: AlignmentDirectional.centerStart,
              ),
              child: Text(
                "Addresses",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              )
          ),
          TextButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                alignment: AlignmentDirectional.centerStart,
              ),
              child: Text(
                "Payment",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              )
          ),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                viewModel.logout(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Text(
                'Logout',
                style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              )
          ),
        ],
      ),
    );
  }
}

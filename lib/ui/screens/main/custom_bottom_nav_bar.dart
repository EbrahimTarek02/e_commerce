import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final MainViewModel viewModel;

  const CustomBottomNavBar(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.07,
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: (){
                viewModel.changeBottomNavBarIndex(0);
              },
              icon: CircleAvatar(
                backgroundColor: viewModel.currentIndex == 0 ? AppColors.white : AppColors.primaryColor,
                maxRadius: 18,
                child: ImageIcon(
                  const AssetImage(AppAssets.homeTabIcon),
                  color: viewModel.currentIndex == 0 ? AppColors.primaryColor : AppColors.white,
                  size: 18,
                ),
              )
          ),
          IconButton(
              onPressed: (){
                viewModel.changeBottomNavBarIndex(1);
              },
              icon: CircleAvatar(
                backgroundColor: viewModel.currentIndex == 1 ? AppColors.white : AppColors.primaryColor,
                maxRadius: 18,
                child: ImageIcon(
                  const AssetImage(AppAssets.categoryTabIcon),
                  color: viewModel.currentIndex == 1 ? AppColors.primaryColor : AppColors.white,
                  size: 18,
                ),
              )
          ),
          IconButton(
              onPressed: (){
                viewModel.changeBottomNavBarIndex(2);
              },
              icon: CircleAvatar(
                backgroundColor: viewModel.currentIndex == 2 ? AppColors.white : AppColors.primaryColor,
                maxRadius: 18,
                child: ImageIcon(
                  const AssetImage(AppAssets.wishListTabIcon),
                  color: viewModel.currentIndex == 2 ? AppColors.primaryColor : AppColors.white,
                  size: 18,
                ),
              )
          ),
          IconButton(
              onPressed: (){
                viewModel.changeBottomNavBarIndex(3);
              },
              icon: CircleAvatar(
                backgroundColor: viewModel.currentIndex == 3 ? AppColors.white : AppColors.primaryColor,
                maxRadius: 18,
                child: ImageIcon(
                  const AssetImage(AppAssets.profileTabIcon),
                  color: viewModel.currentIndex == 3 ? AppColors.primaryColor : AppColors.white,
                  size: 18,
                ),
              )
          ),
        ],
      ),
    );
  }
}

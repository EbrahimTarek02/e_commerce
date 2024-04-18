import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/screens/main/tabs/wish_list/widgets/wish_list_item.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class WishListTab extends StatefulWidget {
  const WishListTab({Key? key}) : super(key: key);

  @override
  State<WishListTab> createState() => _WishListTabState();
}

class _WishListTabState extends State<WishListTab> {

  late MainViewModel viewModel;

  @override
  void initState() {
    viewModel = BlocProvider.of(context);
    viewModel.getWishList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainViewModel, MainStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is MainSuccessState) {
          return MainViewModel.wishList.isEmpty
              ?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: Text(
                  "You don't have any products in your favourites",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor
                  ),
                ),
              ),
            )
              :
            ListView.builder(
              padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 16.0
              ),
              itemCount: MainViewModel.wishList.length,
              itemBuilder: (context, index) => WishListItem(MainViewModel.wishListProducts.toList()[index]),
          );
        }
        else if (state is MainErrorState) {
          return const Center(child: Text("error"),);
        }
        else {
          return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
        }
      },
    );
  }
}

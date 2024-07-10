import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/screens/main/tabs/wish_list/widgets/wish_list_item.dart';
import 'package:e_commerce/ui/shared_widgets/failure_widget.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
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
        if (state is MainSuccessState || state is CartIconLoadingState) {
          return MainViewModel.wishList.isEmpty
              ?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    AppAssets.emptyWishListImage
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
                Text(
                  "Your wish list is empty",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                Text(
                  "Tab the heart button to start saving your favourite items.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor.withOpacity(0.7)
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.08,),
              ],
            ),
          )
              :
          ListView.builder(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0
            ),
            itemCount: MainViewModel.wishList.length,
            itemBuilder: (context, index) {
              bool isInCart = MainViewModel.cartIDs.contains(MainViewModel.wishListProducts.toList()[index].id);
              return WishListItem(MainViewModel.wishListProducts.toList()[index], isInCart);
            }
          );
        }
        else if (state is MainErrorState) {
          return FailureWidget(errorMessage: state.errorMessage, tryAgainFunction: viewModel.getWishList);
        }
        else {
          return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
        }
      },
    );
  }
}

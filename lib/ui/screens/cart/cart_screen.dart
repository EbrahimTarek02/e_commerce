import 'package:e_commerce/ui/screens/cart/cart_states.dart';
import 'package:e_commerce/ui/screens/cart/cart_view_model.dart';
import 'package:e_commerce/ui/screens/cart/widgets/cart_item.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {

  static const String routeName = "cart screen";

  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  late MainViewModel mainViewModel;
  late CartViewModel viewModel;

  @override
  void initState() {
    mainViewModel = BlocProvider.of(context);
    viewModel = BlocProvider.of(context);
    mainViewModel.getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        viewModel.updateCartCounter();
        return Future.value(false);
      },
      child: BlocListener<CartViewModel, CartStates>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is CartLoadingState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    "Loading",
                    style: GoogleFonts.poppins(
                        color: AppColors.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  content: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      width: MediaQuery.sizeOf(context).width * 0.05,
                      child: const Center(child: CircularProgressIndicator()))
                );
              }
            );
          }
          else if (state is CartErrorState) {
            Navigator.pop(context);

            showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      "Error",
                      style: GoogleFonts.poppins(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    content: Text(
                      state.errorMessage,
                      style: GoogleFonts.poppins(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor
                        ),
                        child: Text(
                          "Ok",
                          style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ],
                  );
                }
            );
          }
          else if (state is CartSuccessState){
            Navigator.pop(context);
            Navigator.pop(context);
          }
        },
        child: Scaffold(
            backgroundColor: AppColors.white,

            appBar: AppBar(
              iconTheme: const IconThemeData(color: AppColors.primaryColor),

              title: Text(
                "Cart",
                style: GoogleFonts.poppins(
                    color: AppColors.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),

            body: BlocBuilder<MainViewModel, MainStates>(
              bloc: mainViewModel,
              builder: (context, cartState) {
                if (cartState is MainSuccessState) {
                  viewModel.totalPrice = cartState.data.cart?.totalCartPrice;
                  if (cartState.data.numOfCartItems <= 0){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Center(
                        child: Text(
                          "You don't have any products in your cart",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor
                          ),
                        ),
                      ),
                    );
                  }
                  else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 85,
                            child: ListView.builder(
                              itemCount: MainViewModel.cartIDs.length,
                              itemBuilder: (context, index) {
                                return CartItem(MainViewModel.cartProducts.toList()[index], cartState.data.cart.cartProducts[index].count);
                              },
                            ),
                          ),
                          Expanded(
                            flex: 15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Total Price",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.primaryColor
                                      ),
                                    ),
                                    BlocBuilder<CartViewModel, CartStates>(
                                      bloc: viewModel,
                                      builder: (context, _) {
                                        return Text(
                                          "EGP ${viewModel.totalPrice}",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.poppins(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.primaryColor
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(15.0),
                                      backgroundColor: AppColors.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      )
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Check Out",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.white
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(width: 20.0,),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: AppColors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }
                else {
                  return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
                }
              },
            ),
        ),
      ),
    );
  }
}

import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/cart/cart_states.dart';
import 'package:e_commerce/ui/screens/cart/cart_view_model.dart';
import 'package:e_commerce/ui/screens/cart/widgets/cart_item.dart';
import 'package:e_commerce/ui/screens/checkout/checkout_screen.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/shared_widgets/error_widget.dart';
import 'package:e_commerce/ui/shared_widgets/failure_widget.dart';
import 'package:e_commerce/ui/shared_widgets/loading_widget.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
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
    viewModel = getIt<CartViewModel>();
    mainViewModel.getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        viewModel.updateCartCounter(true);
        return Future.value(false);
      },
      child: BlocListener<CartViewModel, CartStates>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is CartLoadingState) {
            LoadingWidget.showLoading(context);
          }
          else if (state is CartErrorState) {

            Navigator.pop(context);

            MyErrorWidget.showError(
                context: context,
                errorTitle: "Error",
                errorDescription: state.errorMessage,
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
                  )
                ]
            );
          }

          else if (state is CartSuccessState && viewModel.popBack){
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
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),

            body: BlocBuilder<MainViewModel, MainStates>(
              bloc: mainViewModel,
              builder: (context, cartState) {
                if (cartState is MainSuccessState) {
                  viewModel.subTotalPrice = cartState.data.cart?.totalCartPrice ?? 0;
                  if (cartState.data.cart.cartProducts.length == 0){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.emptyCartImage
                          ),
                          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
                          Text(
                            "Your cart is empty",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor
                            ),
                          ),
                          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                          Text(
                            "Looks like you have not added anything to your cart.",
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
                    );
                  }
                  else {
                    return Column(
                      children: [
                        Expanded(
                          flex: 70,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(16.0),
                            itemCount: MainViewModel.cartIDs.length,
                            itemBuilder: (context, index) {
                              return CartItem(MainViewModel.cartProducts.toList()[index], cartState.data.cart.cartProducts[index].count, viewModel);
                            },
                          ),
                        ),
                        Expanded(
                          flex: 30,
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: AppColors.tabBarBackgroundColor.withOpacity(0.3),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0),
                              )
                            ),
                            child: BlocBuilder<CartViewModel, CartStates>(
                              bloc: viewModel,
                              builder: (context, state) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Sub Total",
                                          style: GoogleFonts.poppins(
                                              color: AppColors.primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width * 0.4,
                                          child: Text(
                                            viewModel.subTotalPrice.toString(),
                                            style: GoogleFonts.poppins(
                                                color: AppColors.primaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                        Text(
                                          " EGP",
                                          style: GoogleFonts.poppins(
                                              color: AppColors.primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                                    Row(
                                      children: [
                                        Text(
                                          "Shipping Fee",
                                          style: GoogleFonts.poppins(
                                              color: AppColors.primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width * 0.4,
                                          child: Text(
                                            viewModel.calculateShippingPrice().toString(),
                                            style: GoogleFonts.poppins(
                                                color: AppColors.primaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                        Text(
                                          " EGP",
                                          style: GoogleFonts.poppins(
                                              color: AppColors.primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.015,),
                                    LayoutBuilder(
                                      builder: (BuildContext context, BoxConstraints constraints) {
                                        return Flex(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          direction: Axis.horizontal,
                                          children: List.generate(viewModel.calculateDashCount(constraints), (_) {
                                            return SizedBox(
                                              width: 10.0,
                                              height: 1.0,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.5)),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.015,),
                                    Row(
                                      children: [
                                        Text(
                                          "Total Price",
                                          style: GoogleFonts.poppins(
                                              color: AppColors.primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width * 0.4,
                                          child: Text(
                                            viewModel.calculateTotalPrice().toString(),
                                            style: GoogleFonts.poppins(
                                                color: AppColors.primaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                        Text(
                                          " EGP",
                                          style: GoogleFonts.poppins(
                                              color: AppColors.primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    ElevatedButton(
                                      onPressed: (){
                                        viewModel.updateCartCounter(false).then((_) {
                                          Navigator.popAndPushNamed(context, CheckoutScreen.routeName, arguments: [viewModel.subTotalPrice, cartState.data.cart.id]);
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                                          backgroundColor: AppColors.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.0),
                                          )
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Check Out",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.white,
                                            ),
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
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                }
                else if (cartState is MainErrorState) {
                  return FailureWidget(errorMessage: cartState.errorMessage, tryAgainFunction: mainViewModel.getCart);
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

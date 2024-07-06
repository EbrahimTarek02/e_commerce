import 'package:e_commerce/data/model/checkout_response/checkout_response.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/checkout/checkout_view_model.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/confirmation/confirmation_states.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/confirmation/confirmation_view_model.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmationTab extends StatefulWidget {

  const ConfirmationTab({Key? key}) : super(key: key);

  @override
  State<ConfirmationTab> createState() => _ConfirmationTabState();
}

class _ConfirmationTabState extends State<ConfirmationTab> {

  final ConfirmationViewModel viewModel = getIt<ConfirmationViewModel>();
  late CheckoutViewModel checkoutViewModel;
  late MainViewModel mainViewModel;

  @override
  void initState() {
    checkoutViewModel = BlocProvider.of(context);
    mainViewModel = BlocProvider.of(context);
    viewModel.addNewOrder(checkoutViewModel.cartID, checkoutViewModel.shippingAddress?.details ?? "", checkoutViewModel.shippingAddress?.phone ?? "", checkoutViewModel.shippingAddress?.city ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmationViewModel, ConfirmationStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is ConfirmationErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        else if (state is ConfirmationSuccessState<CheckoutResponse>) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                      bottom: 16.0,
                      right: 16.0,
                      left: 16.0,
                    ),
                    margin: const EdgeInsets.only(
                        right: 16.0,
                        left: 16.0,
                        top: 30,
                        bottom: 10
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.tabBarBackgroundColor,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Thank you",
                          style: GoogleFonts.poppins(
                              color: AppColors.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Your order was placed successfully",
                          style: GoogleFonts.poppins(
                              color: AppColors.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Date",
                              style: GoogleFonts.poppins(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                              style: GoogleFonts.poppins(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Time",
                              style: GoogleFonts.poppins(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              viewModel.calculateCurrentTime(),
                              style: GoogleFonts.poppins(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Payment Method",
                              style: GoogleFonts.poppins(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              child: Text(
                                viewModel.getPaymentMethod(checkoutViewModel.paymentMethodIndex!),
                                style: GoogleFonts.poppins(
                                    color: AppColors.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                ),
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02,),
                        Divider(color: AppColors.primaryColor.withOpacity(0.5)),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02,),
                        Row(
                          children: [
                            Text(
                              "Sub Total",
                              style: GoogleFonts.poppins(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              child: Text(
                                checkoutViewModel.subTotalPrice.toString(),
                                style: GoogleFonts.poppins(
                                    color: AppColors.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                ),
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              " EGP",
                              style: GoogleFonts.poppins(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.end,
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.35,
                              child: Text(
                                checkoutViewModel.calculateShippingPrice(),
                                style: GoogleFonts.poppins(
                                    color: AppColors.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                ),
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              " EGP",
                              style: GoogleFonts.poppins(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02,),
                        Row(
                          children: [
                            Text(
                              "Total",
                              style: GoogleFonts.poppins(
                                  color: AppColors.primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              child: Text(
                                checkoutViewModel.calculateTotalPrice(),
                                style: GoogleFonts.poppins(
                                    color: AppColors.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                ),
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              " EGP",
                              style: GoogleFonts.poppins(
                                  color: AppColors.primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: LayoutBuilder(
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
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              AppAssets.barcodeIcon,
                              width: MediaQuery.sizeOf(context).width * 0.2,
                              height: MediaQuery.sizeOf(context).height * 0.1,
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              height: MediaQuery.sizeOf(context).height * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                    color: AppColors.primaryColor
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  viewModel.isPaid(checkoutViewModel.paymentMethodIndex!),
                                  style: GoogleFonts.poppins(
                                      color: AppColors.primaryColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                      ],
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: AppColors.white,
                      size: 40,
                    ),
                  ),
                  Positioned(
                      bottom: MediaQuery.sizeOf(context).height * 0.14,
                      left: 0,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      )
                  ),
                  Positioned(
                      bottom: MediaQuery.sizeOf(context).height * 0.14,
                      right: 0,
                      child: CircleAvatar(
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor
                      )
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    mainViewModel.getCart();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  child: Text(
                    "Continue Shopping",
                    style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20.0,)
            ],
          );
        }
        else {
          return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
        }
      },
    );
  }
}

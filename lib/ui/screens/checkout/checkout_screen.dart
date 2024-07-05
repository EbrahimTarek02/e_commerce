import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/checkout/checkout_states.dart';
import 'package:e_commerce/ui/screens/checkout/checkout_view_model.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/confirmation/confirmation_tab.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/payment/payment_tab.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/payment/payment_view_model.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/payment_methods/payment_methods_tab.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/payment_methods/payment_methods_view_model.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/shipping/shipping_tab.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/shipping/shipping_view_model.dart';
import 'package:e_commerce/ui/screens/main/main_view_model.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/addresses/addresses_view_model.dart';
import 'package:e_commerce/ui/shared_widgets/error_widget.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatefulWidget {

  static const String routeName = "checkout screen";

  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  CheckoutViewModel viewModel = getIt<CheckoutViewModel>();
  AddressesViewModel addressesViewModel = getIt<AddressesViewModel>();
  ShippingViewModel shippingViewModel = getIt<ShippingViewModel>();
  PaymentMethodsViewModel paymentMethodsViewModel = getIt<PaymentMethodsViewModel>();
  PaymentViewModel paymentViewModel = getIt<PaymentViewModel>();
  late MainViewModel mainViewModel;

  List<Widget> tabs = [const ShippingTab(), const PaymentMethodsTab(), const PaymentTab(), const ConfirmationTab()];

  @override
  void initState() {
    addressesViewModel.getUserAddresses();
    mainViewModel = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => viewModel),
        BlocProvider(create: (_) => addressesViewModel),
        BlocProvider(create: (_) => shippingViewModel),
        BlocProvider(create: (_) => paymentMethodsViewModel),
        BlocProvider(create: (_) => paymentViewModel),
      ],
      child: BlocBuilder<CheckoutViewModel, CheckoutStates>(
        bloc: viewModel,
        builder: (context, state) {

          List args = ModalRoute.of(context)!.settings.arguments as List;
          paymentViewModel.subTotalPrice = args[0] as int;
          viewModel.subTotalPrice = args[0] as int;
          viewModel.cartID = args[1] as String;

          return WillPopScope(
            onWillPop: () {
              if(viewModel.currentIndex == 3) {
                mainViewModel.getCart();
              }
              return Future.value(true);
            },
            child: Scaffold(
                appBar: AppBar(
                  iconTheme: const IconThemeData(color: AppColors.primaryColor),

                  title: Text(
                    viewModel.appBarTextList[viewModel.currentIndex],
                    style: GoogleFonts.poppins(
                        color: AppColors.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),

                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

                floatingActionButton: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: viewModel.currentIndex > 0 && viewModel.currentIndex < 2,
                        child: FloatingActionButton(
                          onPressed: (){
                            if(viewModel.shippingAddress == null) {
                              MyErrorWidget.showError(context, 'Missing Data', "Select your shipping address or add new one");
                            }
                            else {
                              viewModel.changeTabIndex(viewModel.currentIndex - 1);
                            }
                          },
                          backgroundColor: AppColors.primaryColor,
                          child: const Icon(
                            Icons.keyboard_backspace,
                            color: AppColors.white,
                            size: 28,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: (viewModel.currentIndex < 2 || (viewModel.currentIndex == 2 && viewModel.paymentMethodIndex == 3) || (viewModel.currentIndex == 2 && viewModel.isPayDone)),
                        child:
                        viewModel.currentIndex == 2 && !viewModel.paymentSuccess && viewModel.paymentMethodIndex != 3
                            ?
                        FloatingActionButton.extended(
                          onPressed: (){
                            viewModel.changeIsPayDoneState(false);

                            paymentViewModel.payWithCard();
                          },
                          backgroundColor: AppColors.primaryColor,
                          label: Text(
                            "Try Again",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          icon: const Icon(
                            Icons.refresh,
                            color: AppColors.white,
                          ),
                        )
                            :
                        FloatingActionButton(
                          onPressed: (){
                            if(viewModel.currentIndex == 0 && viewModel.shippingAddress == null) {
                              MyErrorWidget.showError(context, 'Missing Data', "Select your shipping address or add new one");
                            }
                            else if (viewModel.currentIndex == 1 && viewModel.paymentMethodIndex == null) {
                              MyErrorWidget.showError(context, 'Missing Data', "Select your payment method");
                            }
                            else if (viewModel.currentIndex == 1 && viewModel.paymentMethodIndex == 4) {
                              viewModel.changeTabIndex(3);
                            }
                            else {
                              if (viewModel.currentIndex == 2) {
                                viewModel.changeScrollState();
                              }
                              viewModel.changeTabIndex(viewModel.currentIndex + 1);
                            }
                          },
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            viewModel.currentIndex < 2 ? Icons.arrow_right_alt : Icons.check,
                            color: AppColors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                body: LayoutBuilder(
                  builder: (context, constraint) {
                    viewModel.maxHeight = constraint.maxHeight;
                    return SingleChildScrollView(
                        physics: viewModel.scrollable ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            EasyStepper(
                              activeStep: viewModel.currentIndex,
                              titlesAreLargerThanSteps: true,
                              activeStepTextColor: AppColors.primaryColor,
                              activeStepBackgroundColor: AppColors.primaryColor,
                              activeStepIconColor: AppColors.white,
                              finishedStepBackgroundColor: AppColors.primaryColor,
                              finishedStepIconColor: AppColors.white,
                              finishedStepTextColor: AppColors.primaryColor,
                              stepRadius: 23,
                              borderThickness: 3,
                              showLoadingAnimation: false,
                              lineStyle: LineStyle(
                                  lineThickness: 2,
                                  finishedLineColor: AppColors.primaryColor,
                                  unreachedLineColor: AppColors.shadowColor,
                                  activeLineColor: AppColors.shadowColor,
                                  lineType: LineType.normal,
                                  lineLength: MediaQuery.sizeOf(context).width * 0.15
                              ),
                              internalPadding: 14,
                              steps: const [
                                EasyStep(
                                  icon: Icon(Icons.location_on),
                                  title: "Shipping",
                                  activeIcon: Icon(Icons.location_on),
                                  finishIcon: Icon(Icons.location_on),
                                ),
                                EasyStep(
                                  icon: Icon(Icons.receipt),
                                  title: "Payment Methods",
                                  activeIcon: Icon(Icons.receipt),
                                  finishIcon: Icon(Icons.receipt),
                                ),
                                EasyStep(
                                  icon: Icon(Icons.payment),
                                  title: "Payment",
                                  activeIcon: Icon(Icons.payment),
                                  finishIcon: Icon(Icons.payment),
                                ),
                                EasyStep(
                                  icon: Icon(Icons.check),
                                  title: "Confirmation",
                                  activeIcon: Icon(Icons.check),
                                  finishIcon: Icon(Icons.check),
                                ),
                              ],
                            ),
                            tabs[viewModel.currentIndex]
                          ],
                        )
                    );
                  },
                )
            ),
          );
        },
      ),
    );
  }
}

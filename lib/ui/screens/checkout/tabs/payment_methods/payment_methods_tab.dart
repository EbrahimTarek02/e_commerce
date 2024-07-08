import 'package:e_commerce/ui/screens/checkout/tabs/payment_methods/payment_methods_view_model.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/payment_methods/widgets/payment_method_item.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodsTab extends StatefulWidget {
  const PaymentMethodsTab({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsTab> createState() => _PaymentMethodsTabState();
}

class _PaymentMethodsTabState extends State<PaymentMethodsTab> {
  late PaymentMethodsViewModel viewModel;

  @override
  void initState() {
    viewModel = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Select payment method",
            style: GoogleFonts.poppins(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02,),

          Column(
            children: [
              const PaymentMethodItem("Master Card", AppAssets.masterCardLogo, 0),
              const PaymentMethodItem("Visa", AppAssets.visaLogo, 1),
              const PaymentMethodItem("Meza", AppAssets.mezaLogo, 2),
              const PaymentMethodItem("Pay with bill reference", AppAssets.payWitCodeIcon, 3),
              const PaymentMethodItem("Cash on Delivery", AppAssets.cashOnDeliveryIcon, 4),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.1,)
            ],
          )
        ],
      ),
    );
  }
}

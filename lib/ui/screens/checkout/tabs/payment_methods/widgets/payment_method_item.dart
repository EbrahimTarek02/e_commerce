import 'package:e_commerce/ui/screens/checkout/checkout_view_model.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/payment_methods/payment_methods_states.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/payment_methods/payment_methods_view_model.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodItem extends StatefulWidget {
  final String title;
  final String logo;
  final int index;

  const PaymentMethodItem(this.title, this.logo, this.index, {Key? key}) : super(key: key);

  @override
  State<PaymentMethodItem> createState() => _PaymentMethodItemState();
}

class _PaymentMethodItemState extends State<PaymentMethodItem> {
  late PaymentMethodsViewModel viewModel;
  late CheckoutViewModel checkoutViewModel;

  @override
  void initState() {
    viewModel = BlocProvider.of(context);
    checkoutViewModel = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentMethodsViewModel, PaymentMethodsStates>(
      bloc: viewModel,
      builder: (context, state) {
        return InkWell(
          onTap: (){
            viewModel.changePaymentMethod(widget.index);
            checkoutViewModel.paymentMethodIndex = widget.index;
          },
          child: Container(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 8.0),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(14.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      widget.logo,
                      width: MediaQuery.sizeOf(context).width * 0.1,
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.05,),
                    Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                          color: AppColors.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const Spacer(),
                    Radio(
                        value: widget.index,
                        groupValue: viewModel.currentMethod,
                        onChanged: (newValue) {
                          viewModel.changePaymentMethod(newValue ?? 0);
                          checkoutViewModel.paymentMethodIndex = newValue;
                        }
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

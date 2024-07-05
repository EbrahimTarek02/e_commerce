import 'package:e_commerce/data/model/addresses_response/addresses_response.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/shipping/shipping_view_model.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShippingItem extends StatelessWidget {
  final ShippingViewModel viewModel;
  final Data address;

  const ShippingItem(this.viewModel, this.address, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0, right: 16.0),
      margin: const EdgeInsets.only(top: 20.0),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                address.name ?? "Address Name",
                style: GoogleFonts.poppins(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
              address.id == viewModel.currentRadioButton ?
              const Icon(
                Icons.local_shipping_rounded,
                color: AppColors.primaryColor,
                size: 32,
              )
                  :
                  const SizedBox()
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
          Text(
            address.details ?? "Address Details",
            style: GoogleFonts.poppins(
                color: AppColors.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
          Text(
            address.city ?? "Address City",
            style: GoogleFonts.poppins(
                color: AppColors.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
          Text(
            address.phone ?? "Address Contact Info",
            style: GoogleFonts.poppins(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}

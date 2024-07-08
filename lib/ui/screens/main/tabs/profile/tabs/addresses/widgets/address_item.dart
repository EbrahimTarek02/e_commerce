import 'package:e_commerce/data/model/addresses_response/addresses_response.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/addresses/addresses_view_model.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressItem extends StatelessWidget {
  final AddressesViewModel viewModel;
  final Data address;

  const AddressItem(this.viewModel, this.address, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16.0, left: 16.0, right: 8.0),
      margin: const EdgeInsets.only(top: 20.0, right: 16.0, left: 16.0),
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
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.65,
                child: Text(
                  address.name ?? "Address Name",
                  style: GoogleFonts.poppins(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              IconButton(
                  onPressed: (){
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
                    viewModel.deleteUserAddresses(address.id ?? "").then((value) => Navigator.pop(context));
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: AppColors.red,
                  )
              ),
            ],
          ),
          Text(
            address.details ?? "Address Details",
            style: GoogleFonts.poppins(
                color: AppColors.primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.005,),
          Text(
            address.city ?? "Address City",
            style: GoogleFonts.poppins(
                color: AppColors.primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.005,),
          Text(
            address.phone ?? "Address Contact Info",
            style: GoogleFonts.poppins(
                color: AppColors.primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}

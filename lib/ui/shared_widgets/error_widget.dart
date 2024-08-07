import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyErrorWidget {

  static void showError(
      {required BuildContext context,
      required String errorTitle,
      required String errorDescription,
      required List<Widget> actions
      }) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            icon: errorDescription == Constants.networkErrorMessage
                ?
            const Icon(
              Icons.wifi_off,
              color: AppColors.red,
              size: 40,
            )
                :
            const Icon(
              Icons.error,
              color: AppColors.red,
              size: 40,
            ),
            title: Text(
              errorDescription == Constants.networkErrorMessage ? "Network Error" : errorTitle,
              style: GoogleFonts.poppins(
                  color: AppColors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),
            ),
            content: Text(
              errorDescription,
              style: GoogleFonts.poppins(
                  color: AppColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.center,
            ),
            actions: actions,
            alignment: Alignment.center,
            actionsAlignment: MainAxisAlignment.center,
            surfaceTintColor: AppColors.red,
            scrollable: true,
          );
        }
    );
  }
}
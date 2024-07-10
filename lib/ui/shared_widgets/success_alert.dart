import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessAlert {

  static void showSuccessAlert(
      {required BuildContext context,
        required String title,
        required String description,
        required List<Widget> actions
      }) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(
              Icons.check_circle,
              color: AppColors.primaryColor,
              size: 40,
            ),
            title: Text(
              title,
              style: GoogleFonts.poppins(
                  color: AppColors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),
            ),
            content: Text(
              description,
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
            scrollable: true,
          );
        }
    );
  }
}
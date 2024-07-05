import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyErrorWidget {

  static void showError(BuildContext context, String errorTitle, String errorDescription) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text(
              errorTitle,
              style: GoogleFonts.poppins(
                  color: AppColors.primaryColor,
                  fontSize: 20,
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
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
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
}
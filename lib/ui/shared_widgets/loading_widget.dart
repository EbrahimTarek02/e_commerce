import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingWidget {
  static void showLoading(BuildContext context) {
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
  }
}
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SentCodeItem extends StatelessWidget{

  final TextEditingController controller;
  final TextInputType keyboardType;

  const SentCodeItem({super.key, required this.controller, required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.14,
        height: MediaQuery.of(context).size.height * 0.08,
        child: TextFormField(
        controller: controller,

        keyboardType: keyboardType,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          filled: true,
          focusColor: AppColors.white,
          errorStyle:
          GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          suffixIconColor: AppColors.textFormFieldIconColor),
          textAlign: TextAlign.center,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
        )
    );
  }

}
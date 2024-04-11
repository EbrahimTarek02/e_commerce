import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType keyboardType;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isPassword;
  final dynamic viewModel;
  final TextEditingController? controller;
  final bool? isEnabled;

  const CustomTextFormField(
      {super.key,
      required this.keyboardType,
      required this.hintText,
      required this.isPassword,
      this.controller,
      this.validator,
      this.viewModel,
      this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,

        keyboardType: keyboardType,
        obscureText: isPassword ? viewModel!.isObscured : false,
        enabled: isEnabled ?? true,
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            focusColor: AppColors.white,
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
                color: AppColors.black.withOpacity(0.7),
                fontSize: 16,
                fontWeight: FontWeight.w300),
            errorStyle:
            GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            suffixIcon: isPassword
                ? IconButton(
                    icon: viewModel!.isObscured
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () => viewModel!.changePasswordVisibility(),
                  )
                : null,
            suffixIconColor: AppColors.textFormFieldIconColor),
        validator: validator);
  }
}

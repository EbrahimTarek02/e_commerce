import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/authentication/authentication_states.dart';
import 'package:e_commerce/ui/screens/authentication/forgot_password/verify_email/verify_email_view_model.dart';
import 'package:e_commerce/ui/screens/authentication/forgot_password/verify_sent_code/verify_sent_code_screen.dart';
import 'package:e_commerce/ui/shared_widgets/custom_text_form_field.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyEmailScreen extends StatelessWidget {
  static const String routeName = "Forgot Password Screen";

  final VerifyEmailViewModel viewModel = getIt<VerifyEmailViewModel>();

  VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: AppColors.white),
        title: Text(
          "Forgot Password",
          style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.normal),
        ),
      ),

      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  decoration:  const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image:  AssetImage(AppAssets.verifyPasswordImage)
                      )
                  )
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
              Text(
                "Password Recovery",
                style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              Text(
                "Enter your email to recover your password",
                style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                hintText: "Enter Your Email",
                isPassword: false,
                controller: viewModel.email,
                validator: (_) => viewModel.validateEmail()
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
              BlocConsumer<VerifyEmailViewModel, AuthenticationStates>(
                bloc: viewModel,
                listener: (context, state) {
                  if (state is AuthenticationErrorState) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            title: Text(
                              "Failed to Verify Your Email",
                              style: GoogleFonts.poppins(
                                  color: AppColors.black.withOpacity(0.7),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            content: Text(
                              state.errorMessage,
                              style: GoogleFonts.poppins(
                                  color: AppColors.black.withOpacity(0.7),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            actions: [
                              TextButton(
                                child: Text(
                                  "Confirm",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.black.withOpacity(0.7),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          );
                        });
                  }
                  else if (state is AuthenticationSuccessState) {
                    Navigator.pushNamed(
                      context,
                      VerifySentCodeScreen.routeName,
                      arguments: viewModel.email.text
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        viewModel.verifyEmail();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: state is AuthenticationLoadingState
                              ? AppColors.primaryColor
                              : AppColors.white,
                          elevation: 0.0,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child:
                      state is AuthenticationLoadingState
                          ? const CircularProgressIndicator(color: AppColors.white,)
                          : Text(
                        'Recover Password',
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )
                  );
                }

              ),
            ],
          ),
        ),
      ),
    );
  }
}

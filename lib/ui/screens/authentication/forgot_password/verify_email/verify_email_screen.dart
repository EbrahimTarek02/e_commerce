import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/authentication/authentication_states.dart';
import 'package:e_commerce/ui/screens/authentication/forgot_password/verify_email/verify_email_view_model.dart';
import 'package:e_commerce/ui/screens/authentication/forgot_password/verify_sent_code/verify_sent_code_screen.dart';
import 'package:e_commerce/ui/shared_widgets/custom_text_form_field.dart';
import 'package:e_commerce/ui/shared_widgets/error_widget.dart';
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
              fontSize: 18,
              fontWeight: FontWeight.normal),
        ),
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 60),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Text(
                "Password Recovery",
                style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              Text(
                "Enter your email to recover your password",
                style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05,),
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                hintText: "Enter Your Email",
                isPassword: false,
                controller: viewModel.email,
                validator: (_) => viewModel.validateEmail()
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
              BlocConsumer<VerifyEmailViewModel, AuthenticationStates>(
                bloc: viewModel,
                listener: (context, state) {
                  if (state is AuthenticationErrorState) {
                    MyErrorWidget.showError(
                        context: context,
                        errorTitle: "Failed to Verify Your Email",
                        errorDescription: state.errorMessage,
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
                          )
                        ]
                    );
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
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child:
                      state is AuthenticationLoadingState
                          ? const CircularProgressIndicator(color: AppColors.white,)
                          : Text(
                        'Recover Password',
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 16,
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

import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/authentication/authentication_states.dart';
import 'package:e_commerce/ui/screens/authentication/forgot_password/reset_password/reset_password_view_model.dart';
import 'package:e_commerce/ui/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:e_commerce/ui/shared_widgets/custom_text_form_field.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = "reset password screen";

  final ResetPasswordViewModel viewModel = getIt<ResetPasswordViewModel>();

  ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String args = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: viewModel.formKey,
            child: BlocConsumer<ResetPasswordViewModel, AuthenticationStates>(
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
                              "Failed to Reset Your Password",
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
                    Navigator.pushNamedAndRemoveUntil(context, SignInScreen.routeName, (Route<dynamic> route) => false);
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.08),
                      const CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: 90,
                        child: Icon(
                          Icons.lock_reset_outlined,
                          size: 120.0,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.04),
                      Text(
                        "Reset Your Password",
                        style: GoogleFonts.poppins(
                            color: AppColors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Please enter your new password",
                        style: GoogleFonts.poppins(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.06),
                      CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          hintText: args,
                          isPassword: false,
                          isEnabled: false,
                          viewModel: viewModel),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02),
                      CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          hintText: "Enter Your New Password",
                          isPassword: true,
                          viewModel: viewModel,
                          controller: viewModel.newPassword,
                          validator: (_) => viewModel.validatePassword()),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                      ElevatedButton(
                          onPressed: () {
                            viewModel.resetPassword(args);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  state is AuthenticationLoadingState
                                      ? AppColors.primaryColor
                                      : AppColors.white,
                              elevation: 0.0,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(15))),
                          child: state is AuthenticationLoadingState
                              ? const CircularProgressIndicator(
                                  color: AppColors.white,
                                )
                              : Text(
                                  'Reset Password',
                                  style: GoogleFonts.poppins(
                                      color: AppColors.primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}

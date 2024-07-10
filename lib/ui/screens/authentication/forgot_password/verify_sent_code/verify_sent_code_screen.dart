import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/authentication/authentication_states.dart';
import 'package:e_commerce/ui/screens/authentication/forgot_password/reset_password/reset_password_screen.dart';
import 'package:e_commerce/ui/screens/authentication/forgot_password/verify_sent_code/verify_sent_code_view_model.dart';
import 'package:e_commerce/ui/shared_widgets/error_widget.dart';
import 'package:e_commerce/ui/shared_widgets/sent_code_item.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifySentCodeScreen extends StatelessWidget {
  static const String routeName = "verify sent code screen";

  final VerifySentCodeViewModel viewModel = getIt<VerifySentCodeViewModel>();

  VerifySentCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String args = ModalRoute.of(context)!.settings.arguments.toString();

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

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 60),
          child: BlocConsumer<VerifySentCodeViewModel, AuthenticationStates>(
            bloc: viewModel,
            listener: (context, state) {
              if (state is AuthenticationErrorState) {
                MyErrorWidget.showError(
                    context: context,
                    errorTitle: "Failed to Verify Your code",
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
                Navigator.pushReplacementNamed(context, routeName);
              }
              else if (state is VerifySentCodeSuccessState){
                Navigator.pushNamedAndRemoveUntil(context, ResetPasswordScreen.routeName, (Route<dynamic> route) => false, arguments: args);
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Check your mail",
                    style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                  Text(
                    "We have sent verification code to your mail",
                    style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SentCodeItem(
                        keyboardType: TextInputType.number,
                        controller: viewModel.number1,
                      ),
                      SentCodeItem(
                        keyboardType: TextInputType.number,
                        controller: viewModel.number2,
                      ),
                      SentCodeItem(
                        keyboardType: TextInputType.number,
                        controller: viewModel.number3,
                      ),SentCodeItem(
                        keyboardType: TextInputType.number,
                        controller: viewModel.number4,
                      ),SentCodeItem(
                        keyboardType: TextInputType.number,
                        controller: viewModel.number5,
                      ),SentCodeItem(
                        keyboardType: TextInputType.number,
                        controller: viewModel.number6,
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
                  TweenAnimationBuilder(
                    tween: Tween(begin: const Duration(minutes: 10), end: Duration.zero),
                    duration: const Duration(minutes: 10),
                    builder: (_, Duration value, __) {
                      return Text(
                          "Code expires in ${value.inMinutes < 10 ? "0" : ""}${value.inMinutes}:${value.inSeconds % 60 < 10 ? "0" : ""}${value.inSeconds % 60}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                      );
                    }
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.12),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.verifySentCode();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: state is VerifySentCodeLoadingState
                              ? AppColors.primaryColor
                              : AppColors.white,
                          elevation: 0.0,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child:
                      state is VerifySentCodeLoadingState
                          ? const CircularProgressIndicator(color: AppColors.white,)
                          : Text(
                        'Verify',
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.verifyEmail(args);
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
                        'Send Again',
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}

import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/authentication/authentication_states.dart';
import 'package:e_commerce/ui/screens/authentication/forgot_password/verify_email/verify_email_screen.dart';
import 'package:e_commerce/ui/screens/authentication/sign_in/sign_in_view_model.dart';
import 'package:e_commerce/ui/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:e_commerce/ui/screens/main/main_screen.dart';
import 'package:e_commerce/ui/shared_widgets/custom_text_form_field.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = 'sign in screen';

  final SignInViewModel viewModel = getIt<SignInViewModel>();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInViewModel, AuthenticationStates>(
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
                    "Login Failed",
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
          Navigator.pushNamedAndRemoveUntil(context, MainScreen.routeName, (Route<dynamic> route) => false);
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    AppAssets.appLogoWhite,
                    height: MediaQuery.sizeOf(context).height * 0.25,
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                  Text(
                    'Welcome Back To Route',
                    style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Please sign in with your mail',
                    style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
                  Text(
                    'Email',
                    style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                  CustomTextFormField(
                      controller: viewModel.email,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Enter Your Email',
                      validator: (_) => viewModel.validateEmail(),
                      isPassword: false),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
                  Text(
                    'Password',
                    style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                  CustomTextFormField(
                    controller: viewModel.password,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: 'Enter Your Password',
                    validator: (_) => viewModel.validatePassword(),
                    isPassword: true,
                    viewModel: viewModel,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, VerifyEmailScreen.routeName);
                        },
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.centerRight,
                        ),
                        child: Text(
                          'Forgot Password',
                          style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.signIn();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: state is AuthenticationLoadingState
                          ? AppColors.primaryColor
                          : AppColors.white,
                          elevation: 0.0,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: state is AuthenticationLoadingState
                          ? const CircularProgressIndicator(color: AppColors.white,)
                          : Text(
                              'Sign In',
                              style: GoogleFonts.poppins(
                                  color: AppColors.primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                    child: Text(
                      'Don’t have an account? Create Account',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

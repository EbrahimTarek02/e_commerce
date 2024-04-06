import 'package:e_commerce/ui/screens/authentication/authentication_states.dart';
import 'package:e_commerce/ui/screens/authentication/authentication_view_model.dart';
import 'package:e_commerce/ui/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:e_commerce/ui/shared_widgets/custom_text_form_field.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "sign up screen";

  final AuthenticationViewModel viewModel = AuthenticationViewModel();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationViewModel, AuthenticationStates>(
      bloc: viewModel,
      builder: (context, state) => Scaffold(
        backgroundColor: AppColors.primaryColor,

        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

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
                    'Full Name',
                    style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal
                    ),
                  ),

                  CustomTextFormField(
                    controller: viewModel.fullName,
                      keyboardType: TextInputType.name,
                      hintText: 'Enter Your Full Name',
                      validator: (_) => viewModel.validateFullName(),
                      isPassword: false
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),

                  Text(
                    'Phone Number',
                    style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal
                    ),
                  ),

                  CustomTextFormField(
                    controller: viewModel.phoneNumber,
                    keyboardType: TextInputType.phone,
                    hintText: 'Enter Your Phone Number',
                    isPassword: false,
                    viewModel: viewModel,
                    validator: (_) => viewModel.validatePhoneNumber(),
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),

                  Text(
                    'Email',
                    style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal
                    ),
                  ),

                  CustomTextFormField(
                    controller: viewModel.email,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Enter Your Phone Email',
                    isPassword: false,
                    viewModel: viewModel,
                    validator: (_) => viewModel.validateEmail(),
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),

                  Text(
                    'Password',
                    style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal
                    ),
                  ),

                  CustomTextFormField(
                    controller: viewModel.password,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: 'Enter Your Password',
                    validator: (_) => viewModel.validatePassword(),
                    isPassword: true,
                    viewModel: viewModel,
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),

                  Text(
                    'Confirm Password',
                    style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal
                    ),
                  ),

                  CustomTextFormField(
                    controller: viewModel.passwordConfirmation,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: 'Re-enter Your Password',
                    validator: (_) => viewModel.validatePasswordConfirmation(),
                    isPassword: true,
                    viewModel: viewModel,
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),

                  ElevatedButton(
                    onPressed: () {
                      viewModel.formKey.currentState!.validate();
                      // Navigate to home screen
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        )
                    ),

                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.poppins(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),

                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                    child: Text(
                      'Already have account? Sign In',
                      style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal
                      ),
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

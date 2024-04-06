import 'package:e_commerce/ui/screens/authentication/authentication_states.dart';
import 'package:e_commerce/ui/screens/authentication/authentication_view_model.dart';
import 'package:e_commerce/ui/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:e_commerce/ui/shared_widgets/custom_text_form_field.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = 'sign in screen';

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  AuthenticationViewModel viewModel = AuthenticationViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationViewModel, AuthenticationStates>(
      bloc: viewModel,
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
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    'Please sign in with your mail',
                    style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300
                    ),
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
                    hintText: 'Enter Your Email',
                    validator: (_) => viewModel.validateEmail(),
                    isPassword: false
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

                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: (){
                          // Navigate to Forgot Password Screen
                        },
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.centerRight,
                        ),
                        child: Text(
                          'Forgot Password',
                          style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),

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
                      'Sign In',
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
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                    child: Text(
                      'Don’t have an account? Create Account',
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

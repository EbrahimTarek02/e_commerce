import 'package:e_commerce/ui/screens/sign_in/sign_in_states.dart';
import 'package:e_commerce/ui/screens/sign_in/sign_in_view_model.dart';
import 'package:e_commerce/ui/screens/sign_up/sign_up_screen.dart';
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
  SignInViewModel viewModel = SignInViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInViewModel, SignInStates>(
      bloc: viewModel,
      builder: (context, signInStates) => Scaffold(
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
                  TextFormField(
                    // controller: ,

                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      filled: true,
                      focusColor: AppColors.white,

                      hintText: 'Enter Your Email',
                      hintStyle: GoogleFonts.poppins(
                        color: AppColors.black.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w300
                      ),

                      errorStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    ),

                    validator: (inputText) => viewModel.validateEmail(inputText)
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
                  TextFormField(
                    // controller: ,

                    keyboardType: TextInputType.visiblePassword,
                    obscureText: viewModel.isObscured,

                    decoration: InputDecoration(
                      filled: true,
                      focusColor: AppColors.white,

                      hintText: 'Enter Your Password',
                      hintStyle: GoogleFonts.poppins(
                          color: AppColors.black.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w300
                      ),

                      errorStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

                      suffixIcon: IconButton(
                        icon: viewModel.isObscured ?
                              const Icon(Icons.visibility) :
                              const Icon(Icons.visibility_off),
                        onPressed: () => viewModel.changePasswordVisibility(),
                      ),
                      suffixIconColor: AppColors.textFormFieldIconColor
                    ),

                    validator: (inputText) => viewModel.validatePassword(inputText)
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
                      'Login',
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

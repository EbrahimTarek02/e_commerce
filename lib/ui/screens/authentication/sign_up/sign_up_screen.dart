import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/authentication/authentication_states.dart';
import 'package:e_commerce/ui/screens/authentication/sign_up/sign_up_view_model.dart';
import 'package:e_commerce/ui/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:e_commerce/ui/screens/main/main_screen.dart';
import 'package:e_commerce/ui/shared_widgets/custom_text_form_field.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "sign up screen";

  SignUpScreen({super.key});

  final SignUpViewModel viewModel = getIt<SignUpViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpViewModel, AuthenticationStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is AuthenticationErrorState){
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  title: Text(
                    "Register Failed",
                    style: GoogleFonts.poppins(
                        color: AppColors.black.withOpacity(0.7),
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  content: Text(
                    state.errorMessage,
                    style: GoogleFonts.poppins(
                        color: AppColors.black.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: Text(
                        "Confirm",
                        style: GoogleFonts.poppins(
                            color: AppColors.black.withOpacity(0.7),
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      onPressed:  () => Navigator.pop(context),
                    )
                  ],
                );
              }
          );
        }
        else if (state is AuthenticationSuccessState) {
          Navigator.pushNamedAndRemoveUntil(context, MainScreen.routeName, (Route<dynamic> route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: SingleChildScrollView(
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
                        height: MediaQuery.sizeOf(context).height * 0.23,
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01),
                      Text(
                        'Full Name',
                        style: GoogleFonts.poppins(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                      CustomTextFormField(
                          controller: viewModel.fullName,
                          keyboardType: TextInputType.name,
                          hintText: 'Enter Your Full Name',
                          validator: (_) => viewModel.validateFullName(),
                          isPassword: false),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03),
                      Text(
                        'Phone Number',
                        style: GoogleFonts.poppins(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                      CustomTextFormField(
                        controller: viewModel.phoneNumber,
                        keyboardType: TextInputType.phone,
                        hintText: 'Enter Your Phone Number',
                        isPassword: false,
                        viewModel: viewModel,
                        validator: (_) => viewModel.validatePhoneNumber(),
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03),
                      Text(
                        'Email',
                        style: GoogleFonts.poppins(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                      CustomTextFormField(
                        controller: viewModel.email,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Enter Your Email',
                        isPassword: false,
                        viewModel: viewModel,
                        validator: (_) => viewModel.validateEmail(),
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03),
                      Text(
                        'Password',
                        style: GoogleFonts.poppins(
                            color: AppColors.white,
                            fontSize: 16,
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
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03),
                      Text(
                        'Confirm Password',
                        style: GoogleFonts.poppins(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                      CustomTextFormField(
                        controller: viewModel.passwordConfirmation,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: 'Re-enter Your Password',
                        validator: (_) =>
                            viewModel.validatePasswordConfirmation(),
                        isPassword: true,
                        viewModel: viewModel,
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.06),
                      ElevatedButton(
                        onPressed: () {
                          viewModel.signUp(context);
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
                        state is AuthenticationLoadingState ?
                        const CircularProgressIndicator(color: AppColors.white)
                            :
                        Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                              color: AppColors.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
                      Row(
                        children: [
                          const Expanded(child: Divider(color: AppColors.white,)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              'Or Continue with',
                              style: GoogleFonts.poppins(
                                  color: AppColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          const Expanded(child: Divider(color: AppColors.white,)),
                        ],
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.white,
                            maxRadius: 18.0,

                            child: Image.asset(
                              AppAssets.googleLogo,
                              scale: 2,
                            ),
                          ),
                          const Icon(
                            Icons.facebook_rounded,
                            color: AppColors.white,
                            size: 40,
                          ),
                          const Icon(
                            Icons.apple_rounded,
                            color: AppColors.white,
                            size: 40,
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                        child: Text(
                          'Already have account? Sign In',
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
      },

    );
  }
}

import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/authentication/authentication_states.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/profile_tab_view_model.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/edit_profile/edit_profile_tab_view_model.dart';
import 'package:e_commerce/ui/shared_widgets/custom_text_form_field.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileTab extends StatelessWidget {

  static const String routeName = "edit profile tab route";

  EditProfileTab({Key? key}) : super(key: key);

  final EditProfileTabViewModel viewModel = getIt<EditProfileTabViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
              color: AppColors.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w500
          ),
        ),
    ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 24.0
          ),
          child: BlocConsumer<EditProfileTabViewModel, AuthenticationStates>(
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
                          "Failed to Update Your Info",
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
              else if (state is AuthenticationInitialState && !viewModel.isEnabled) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        title: Text(
                          "Edit Profile",
                          style: GoogleFonts.poppins(
                              color: AppColors.black.withOpacity(0.7),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        content: Text(
                          "Your Info Updated Successfully",
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
            },
            builder: (context, state) {
              return Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    Text(
                      "Welcome, ${ProfileTabViewModel.user.name}",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      ProfileTabViewModel.user.email!,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                    Text(
                      "Full Name",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.name,
                      hintText: "Enter your Name",
                      isPassword: false,
                      controller: viewModel.fullName,
                      viewModel: viewModel,
                      validator: (_) => viewModel.validateFullName(),
                      isEnabled: viewModel.isEnabled,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                    Text(
                      "Email",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Enter your Email",
                      isPassword: false,
                      controller: viewModel.email,
                      viewModel: viewModel,
                      validator: (_) => viewModel.validateEmail(),
                      isEnabled: viewModel.isEnabled,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                    Text(
                      "Password",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      hintText: "Enter your Password",
                      isPassword: true,
                      controller: viewModel.password,
                      viewModel: viewModel,
                      validator: (_) => viewModel.validatePassword(),
                      isEnabled: viewModel.isEnabled,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                    Text(
                      "Confirm Password",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    CustomTextFormField(
                      controller: viewModel.passwordConfirmation,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: 'Re-enter Your Password',
                      validator: (_) =>
                          viewModel.validatePasswordConfirmation(),
                      isPassword: true,
                      viewModel: viewModel,
                      isEnabled: viewModel.isEnabled,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    state is AuthenticationLoadingState ?
                    const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))
                    :
                    ElevatedButton(
                        onPressed: () {
                          viewModel.changeTextFormFieldState();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            elevation: 0.0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        child: Text(
                          viewModel.isEnabled ? "Save Changes" : "Edit",
                          style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          ),
                        )
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

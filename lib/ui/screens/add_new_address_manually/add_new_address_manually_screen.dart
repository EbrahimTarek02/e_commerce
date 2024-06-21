import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/addresses/addresses_states.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/addresses/addresses_view_model.dart';
import 'package:e_commerce/ui/shared_widgets/custom_text_form_field.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewAddressManually extends StatefulWidget {

  static const String routeName = "add new address manually";

  const AddNewAddressManually({Key? key}) : super(key: key);

  @override
  State<AddNewAddressManually> createState() => _AddNewAddressManuallyState();
}

class _AddNewAddressManuallyState extends State<AddNewAddressManually> {
  late AddressesViewModel viewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = ModalRoute.of(context)!.settings.arguments as AddressesViewModel;
    return Scaffold(

      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        title: Text(
          "Add New Address Manually",
          style: GoogleFonts.poppins(
              color: AppColors.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Text(
                'Address Title',
                style: GoogleFonts.poppins(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              CustomTextFormField(
                  controller: viewModel.addressTitle,
                  keyboardType: TextInputType.name,
                  hintText: 'Ex: Home',
                  validator: (_) => viewModel.validateAddressTitle(),
                  isPassword: false,
              ),
              SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.04),

              Text(
                'Address Details',
                style: GoogleFonts.poppins(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              CustomTextFormField(
                controller: viewModel.addressDetails,
                keyboardType: TextInputType.name,
                hintText: 'Ex: Naser City',
                validator: (_) => viewModel.validateAddressDetails(),
                isPassword: false,
              ),
              SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.04),

              Text(
                'City',
                style: GoogleFonts.poppins(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              CustomTextFormField(
                controller: viewModel.city,
                keyboardType: TextInputType.name,
                hintText: 'Ex: Cairo',
                validator: (_) => viewModel.validateCity(),
                isPassword: false,
              ),
              SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.04),

              Text(
                'Phone Number',
                style: GoogleFonts.poppins(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              CustomTextFormField(
                controller: viewModel.phoneNumber,
                keyboardType: TextInputType.phone,
                hintText: 'Ex: 01122334455',
                validator: (_) => viewModel.validatePhoneNumber(),
                isPassword: false,
              ),
              SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.13),

              BlocBuilder<AddressesViewModel, UserAddressesStates>(
                bloc: viewModel,
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      viewModel.addUserAddress(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: state is UserAddressesLoadingState
                            ? AppColors.white
                            : AppColors.primaryColor,
                        elevation: 0.0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child:
                    state is UserAddressesLoadingState ?
                    const CircularProgressIndicator(color: AppColors.primaryColor)
                        :
                    Text(
                      'Add New Address',
                      style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

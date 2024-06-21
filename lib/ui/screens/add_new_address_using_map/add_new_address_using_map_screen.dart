import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/addresses/addresses_states.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/addresses/addresses_view_model.dart';
import 'package:e_commerce/ui/shared_widgets/custom_text_form_field.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddNewAddressUsingMap extends StatefulWidget {

  static const String routeName = "add_new_address_using_map";

  const AddNewAddressUsingMap({Key? key}) : super(key: key);

  @override
  State<AddNewAddressUsingMap> createState() => _AddNewAddressUsingMapState();
}

class _AddNewAddressUsingMapState extends State<AddNewAddressUsingMap> {
  late AddressesViewModel viewModel;

  @override
  void initState() {
    Future.delayed(Duration.zero, () => viewModel.determinePosition());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  viewModel = ModalRoute.of(context)!.settings.arguments as AddressesViewModel;

    return WillPopScope(
      onWillPop: () {

        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                  title: Text(
                    "You didn't save your address",
                    style: GoogleFonts.poppins(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  content:Text(
                    "Are you sure you want to go back?",
                    style: GoogleFonts.poppins(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                actions: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text(
                      "No",
                      style: GoogleFonts.poppins(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                    )
                  ),
                  ElevatedButton(
                      onPressed: (){
                        viewModel.getUserAddresses();
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Yes",
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),
                      )
                  )
                ],
              );
            }
        );
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.primaryColor),
          title: Text(
            "Pick Your Address",
            style: GoogleFonts.poppins(
              color: AppColors.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (bottomSheetContext) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom + 20.0,
                      top: 20.0,
                      right: 20.0,
                      left: 20.0
                    ),
                    child: Form(
                      key: viewModel.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                              height: MediaQuery.sizeOf(bottomSheetContext).height * 0.05),

                          ElevatedButton(
                            onPressed: () {
                              if (viewModel.addressTitle.text.isNotEmpty && viewModel.phoneNumber.text.isNotEmpty) {
                                Navigator.pop(bottomSheetContext);
                              }

                              if (viewModel.placeMarks.isNotEmpty) {
                                viewModel.addressDetails.text = "${viewModel.placeMarks[0].street} ${viewModel.placeMarks[0].subAdministrativeArea}";
                                viewModel.city.text = viewModel.placeMarks[0].administrativeArea.toString();
                              }
                              else {
                                viewModel.addressDetails.text = 'no results';
                                viewModel.city.text = 'no results';
                              }

                              viewModel.addUserAddress(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                elevation: 0.0,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: Text(
                              'Add New Address',
                              style: GoogleFonts.poppins(
                                  color: AppColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    )
                  );
                }
            );
          },
          backgroundColor: AppColors.primaryColor,

          child: const Icon(
            Icons.check,
            color: AppColors.white,
          ),
        ),

        body: BlocBuilder<AddressesViewModel, UserAddressesStates>(
          bloc: viewModel,
          builder: (context, state) {
            if (state is UserAddressesErrorState) {
              return Text(state.errorMessage);
            }
            else if (state is UserAddressesSuccessState<Position>) {
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(state.data.latitude, state.data.longitude),
                  zoom: (state.data.latitude == 26.8206 && state.data.longitude == 30.8025) ?
                    6 : 16,
                ),
                markers: viewModel.marker,
                onTap: (newPosition) {
                  viewModel.changePosition(newPosition);
                },
              );
            }
            else {
              return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
            }
          },
        ),
      ),
    );
  }
}

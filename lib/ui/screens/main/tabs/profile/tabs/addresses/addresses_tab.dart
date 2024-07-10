import 'package:e_commerce/data/model/addresses_response/addresses_response.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/add_new_address_manually/add_new_address_manually_screen.dart';
import 'package:e_commerce/ui/screens/add_new_address_using_map/add_new_address_using_map_screen.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/addresses/addresses_states.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/addresses/addresses_view_model.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/addresses/widgets/address_item.dart';
import 'package:e_commerce/ui/shared_widgets/failure_widget.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressesTab extends StatefulWidget {

  static const String routeName = "addresses tab";


  const AddressesTab({Key? key}) : super(key: key);

  @override
  State<AddressesTab> createState() => _AddressesTabState();
}

class _AddressesTabState extends State<AddressesTab> {
  final AddressesViewModel viewModel = getIt<AddressesViewModel>();

  @override
  void initState() {
    viewModel.getUserAddresses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        title: Text(
          "Addresses",
          style: GoogleFonts.poppins(
              color: AppColors.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w500
          ),
        ),
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  viewModel.addressTitle.clear();
                                  viewModel.phoneNumber.clear();
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, AddNewAddressUsingMap.routeName, arguments: viewModel);
                                },

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width * 0.25,
                                      height: MediaQuery.sizeOf(context).height * 0.1,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      margin: const EdgeInsets.only(bottom: 10.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(14.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.shadowColor,
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3),
                                            )
                                          ]
                                      ),
                                      child: Image.asset(
                                        AppAssets.mapsIcon,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                      "Use Maps",
                                      style: GoogleFonts.poppins(
                                          color: AppColors.primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  viewModel.addressTitle.clear();
                                  viewModel.addressDetails.clear();
                                  viewModel.city.clear();
                                  viewModel.phoneNumber.clear();
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, AddNewAddressManually.routeName, arguments: viewModel);
                                },

                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width * 0.25,
                                      height: MediaQuery.sizeOf(context).height * 0.1,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      margin: const EdgeInsets.only(bottom: 10.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(14.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.shadowColor,
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3),
                                            )
                                          ]
                                      ),
                                      child: Image.asset(
                                        AppAssets.addManuallyIcon,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                      "Add Manually",
                                      style: GoogleFonts.poppins(
                                          color: AppColors.primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                    }
                  );
                },

                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      color: AppColors.white,
                      size: 20,
                    ),
                    Text(
                      "Add New Address",
                      style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                )
            ),
          ),

          BlocBuilder<AddressesViewModel, UserAddressesStates>(
            bloc: viewModel,
            builder: (context, state) {
              if (state is UserAddressesErrorState) {
                return Padding(
                  padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height *0.27),
                  child: FailureWidget(
                    errorMessage: state.errorMessage,
                    tryAgainFunction: viewModel.getUserAddresses,
                  ),
                );
              }
              else if (state is UserAddressesSuccessState<AddressesResponse>) {
                return state.data.data!.isEmpty
                    ?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.1,),
                      Image.asset(
                          AppAssets.emptyAddressListImage
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
                      Text(
                        "You don't have any saved addresses",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor
                        ),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
                      Text(
                        "Add new addresses to be able to make order.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor.withOpacity(0.7)
                        ),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.08,),
                    ],
                  ),
                )
                    :
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.data.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return AddressItem(viewModel, state.data.data?[index] ?? Data());
                  },
                );
              }
              else {
                return Padding(
                  padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height *0.35),
                  child: const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
                );
              }
            },
          ),
        ],
      ),
      ),
    );
  }
}

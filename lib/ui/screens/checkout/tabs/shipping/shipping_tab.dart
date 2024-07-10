import 'package:e_commerce/data/model/addresses_response/addresses_response.dart';
import 'package:e_commerce/ui/screens/add_new_address_manually/add_new_address_manually_screen.dart';
import 'package:e_commerce/ui/screens/add_new_address_using_map/add_new_address_using_map_screen.dart';
import 'package:e_commerce/ui/screens/checkout/checkout_view_model.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/shipping/shipping_states.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/shipping/shipping_view_model.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/shipping/widgets/shipping_item.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/addresses/addresses_states.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/addresses/addresses_view_model.dart';
import 'package:e_commerce/ui/shared_widgets/failure_widget.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ShippingTab extends StatefulWidget {
  const ShippingTab({Key? key}) : super(key: key);

  @override
  State<ShippingTab> createState() => _ShippingTabState();
}

class _ShippingTabState extends State<ShippingTab> {
  late AddressesViewModel addressesViewModel;
  late ShippingViewModel viewModel;
  late CheckoutViewModel checkoutViewModel;

  @override
  void initState() {
    addressesViewModel = BlocProvider.of(context);
    viewModel = BlocProvider.of(context);
    checkoutViewModel = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Select your shipping address or add new one",
            style: GoogleFonts.poppins(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02,),

          ElevatedButton(
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
                                addressesViewModel.addressTitle.clear();
                                addressesViewModel.phoneNumber.clear();
                                Navigator.pop(context);
                                Navigator.pushNamed(context, AddNewAddressUsingMap.routeName, arguments: addressesViewModel);
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                addressesViewModel.addressTitle.clear();
                                addressesViewModel.addressDetails.clear();
                                addressesViewModel.city.clear();
                                addressesViewModel.phoneNumber.clear();
                                Navigator.pop(context);
                                Navigator.pushNamed(context, AddNewAddressManually.routeName, arguments: addressesViewModel);
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
                                        fontSize: 18,
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
                  const SizedBox(width: 8.0,),
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

          BlocBuilder<AddressesViewModel, UserAddressesStates>(
            bloc: addressesViewModel,
            builder: (context, addressesState) {
              if (addressesState is UserAddressesErrorState) {
                return Padding(
                  padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height *0.15),
                  child: FailureWidget(
                    errorMessage: addressesState.errorMessage,
                    tryAgainFunction: addressesViewModel.getUserAddresses,
                  ),
                );
              }
              else if (addressesState is UserAddressesSuccessState<AddressesResponse>) {
                return (addressesState.data.data?.isEmpty ?? true) ?
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                )
                  :
                BlocBuilder<ShippingViewModel, ShippingStates>(
                  bloc: viewModel,
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: addressesItems(addressesState.data.data),
                    );
                  },
                );
              }
              else {
                return Padding(
                  padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height *0.2),
                  child: const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
                );
              }
            },
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.05,)
        ],
      ),
    );
  }

  List<Widget> addressesItems(List<Data>? data) {
    if (data == null) {
      return [];
    }

    return data.map((address) {
      return InkWell(
        onTap: () {
          viewModel.changeRadioButtonValue(address.id ?? "");
          checkoutViewModel.shippingAddress = address;
        },
        child: ShippingItem(viewModel, address)
      );
    }).toList();
  }
}

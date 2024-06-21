import 'package:e_commerce/data/model/addresses_response/addresses_response.dart';
import 'package:e_commerce/domain/use_cases/addresses_use_cases/add_new_address_use_case.dart';
import 'package:e_commerce/domain/use_cases/addresses_use_cases/delete_user_address_use_case.dart';
import 'package:e_commerce/domain/use_cases/addresses_use_cases/get_user_addresses_use_case.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/addresses/addresses_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@injectable
class AddressesViewModel extends Cubit<UserAddressesStates> {

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController addressTitle = TextEditingController();
  TextEditingController addressDetails = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  late Position currentPosition;
  Set<Marker> marker = {};
  List<geocoding.Placemark> placeMarks = [];
  GetUserAddressesUseCase getUserAddressesUseCase;
  DeleteUserAddressesUseCase deleteUserAddressesUseCase;
  AddUserAddressUseCase addUserAddressUseCase;

  AddressesViewModel(this.getUserAddressesUseCase, this.deleteUserAddressesUseCase, this.addUserAddressUseCase) : super(UserAddressesInitialState());

  Future<void> getUserAddresses() async{
    emit(UserAddressesLoadingState());

    Either<String, AddressesResponse> response = await getUserAddressesUseCase.execute();

    response.fold((error) {
      emit(UserAddressesErrorState(error));
    }, (success) {
      emit(UserAddressesSuccessState<AddressesResponse>(success));
    });
  }

  Future<void> deleteUserAddresses(String addressID) async{
    Either<String, AddressesResponse> response = await deleteUserAddressesUseCase.execute(addressID);

    response.fold((error) {
      emit(UserAddressesErrorState(error));
    }, (success) {
      emit(UserAddressesSuccessState<AddressesResponse>(success));
    });
  }

  String? validateAddressTitle() {
    if (addressTitle.text.isEmpty){
      return "Please Enter Your Address Title";
    }

    return null;
  }

  String? validateAddressDetails() {
    if (addressDetails.text.isEmpty){
      return "Please Enter Your Address Details";
    }

    return null;
  }

  String? validateCity() {
    if (city.text.isEmpty){
      return "Please Enter Your City";
    }

    return null;
  }

  String? validatePhoneNumber() {
    if (phoneNumber.text.isEmpty){
      return "Please Enter Your Phone Number";
    }

    return null;
  }

  Future<void> addUserAddress(BuildContext context) async {
    if (! formKey.currentState!.validate()) return;

    emit(UserAddressesLoadingState());

    Either<String, AddressesResponse> response = await addUserAddressUseCase.addUserAddress(addressTitle.text, addressDetails.text, city.text, phoneNumber.text);

    response.fold((error) {
      emit(UserAddressesErrorState(error));
    }, (success) {
      emit(UserAddressesSuccessState<AddressesResponse>(success));
      Navigator.pop(context);
    });
  }

  Future<void> determinePosition() async {
    emit(UserAddressesLoadingState());

    bool serviceEnabled;
    LocationPermission permission;
    Location location = Location();

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      // if (!serviceEnabled) {
        // emit(UserAddressesErrorState('Location services are disabled.'));
      // }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      // if (permission == LocationPermission.denied) {
      //   emit(UserAddressesErrorState('Location permissions are denied'));
      // }
    }

    // if (permission == LocationPermission.deniedForever) {
    //   emit(UserAddressesErrorState('Location permissions are permanently denied, we cannot request permissions.'));
    // }


    if (!serviceEnabled || (permission == LocationPermission.denied || permission == LocationPermission.deniedForever)) {
      currentPosition = Position(longitude: 30.8025, latitude: 26.8206, timestamp: DateTime(DateTime.now().year), accuracy: 0.0, altitude: 0.0, altitudeAccuracy: 0.0, heading: 0.0, headingAccuracy: 0.0, speed: 0.0, speedAccuracy: 0.0);
      marker.clear();
      marker.add(
          const Marker(
              markerId: MarkerId("id"),
              position: LatLng(26.8206, 30.8025)
          )
      );
      emit(UserAddressesSuccessState<Position>(currentPosition));
      return;
    }

    currentPosition = await Geolocator.getCurrentPosition();
    marker.clear();
    marker.add(
      Marker(
        markerId: const MarkerId("id"),
        position: LatLng(currentPosition.latitude, currentPosition.longitude)
      )
    );

    placeMarks = await getUserAddressData(LatLng(currentPosition.latitude, currentPosition.longitude));

    emit(UserAddressesSuccessState<Position>(currentPosition));
  }

  Future<List<geocoding.Placemark>> getUserAddressData(LatLng currentPosition) async{
    return await geocoding.placemarkFromCoordinates(
      currentPosition.latitude,
      currentPosition.longitude,
    );
  }

  Future<void> changePosition(LatLng newPosition) async{
    marker.clear();
    marker.add(
        Marker(
            markerId: const MarkerId("id"),
            position: LatLng(newPosition.latitude, newPosition.longitude)
        )
    );

    placeMarks = await getUserAddressData(newPosition);

    emit(UserAddressesSuccessState<Position>(currentPosition));
  }
}
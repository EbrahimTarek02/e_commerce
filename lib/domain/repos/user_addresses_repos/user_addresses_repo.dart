import 'package:e_commerce/data/model/addresses_response/addresses_response.dart';
import 'package:either_dart/either.dart';

abstract class UserAddressesRepo {
  Future<Either<String, AddressesResponse>> getUserAddresses();

  Future<Either<String, AddressesResponse>> deleteUserAddresses(String addressID);

  Future<Either<String, AddressesResponse>> addUserAddresses(
      String addressTitle, String addressDetails, city, phoneNumber);
}
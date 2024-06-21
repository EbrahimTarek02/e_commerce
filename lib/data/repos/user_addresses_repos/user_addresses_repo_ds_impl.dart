import 'dart:convert';
import 'package:e_commerce/data/model/addresses_response/addresses_response.dart';
import 'package:e_commerce/data/utils/shared_prefs_utils.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/domain/repos/user_addresses_repos/user_addresses_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserAddressesRepoDS)
class UserAddressesRepoDSImpl extends UserAddressesRepoDS{
  @override
  Future<Either<String, AddressesResponse>> getUserAddresses() async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/addresses";

    try{

      SharedPrefsUtils sharedPrefsUtils = getIt<SharedPrefsUtils>();
      String? userToken = await sharedPrefsUtils.getToken();

      Uri uri = Uri.https(baseUrl, endPoint);
      Response response = await get(
          uri,
          headers: {
            "token" : userToken!
          }
      );

      AddressesResponse addressesResponse = AddressesResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300 && addressesResponse.data != null) {
        return Right(addressesResponse);
      }
      else{
        return Left(addressesResponse.message ?? "Something went wrong please try again latter");
      }
    }
    catch(_) {
      return const Left("Something went wrong please try again latter");
    }
  }

  @override
  Future<Either<String, AddressesResponse>> deleteUserAddresses(String addressID) async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/addresses/$addressID";

    try{

      SharedPrefsUtils sharedPrefsUtils = getIt<SharedPrefsUtils>();
      String? userToken = await sharedPrefsUtils.getToken();

      Uri uri = Uri.https(baseUrl, endPoint);
      Response response = await delete(
          uri,
          headers: {
            "token" : userToken!
          }
      );

      AddressesResponse addressesResponse = AddressesResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300 && addressesResponse.data != null) {
        return Right(addressesResponse);
      }
      else{
        return Left(addressesResponse.message ?? "Something went wrong please try again latter");
      }
    }
    catch(_) {
      return const Left("Something went wrong please try again latter");
    }
  }

  @override
  Future<Either<String, AddressesResponse>> addUserAddresses(String addressTitle, String addressDetails, city, phoneNumber) async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/addresses";

    try{

      SharedPrefsUtils sharedPrefsUtils = getIt<SharedPrefsUtils>();
      String? userToken = await sharedPrefsUtils.getToken();

      Uri uri = Uri.https(baseUrl, endPoint);
      Response response = await post(
        uri,
        headers: {
          "token" : userToken!
        },
        body: {
          "name" : addressTitle,
          "details" : addressDetails,
          "phone" : phoneNumber,
          "city" : city
        }
      );

      AddressesResponse addressesResponse = AddressesResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300 && addressesResponse.data != null) {
        return Right(addressesResponse);
      }
      else{
        return Left(addressesResponse.message ?? "Something went wrong please try again latter");
      }
    }
    catch(_) {
      return const Left("Something went wrong please try again latter");
    }
  }
}
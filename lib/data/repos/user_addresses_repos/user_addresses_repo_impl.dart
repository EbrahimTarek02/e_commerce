import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/data/model/addresses_response/addresses_response.dart';
import 'package:e_commerce/domain/repos/user_addresses_repos/user_addresses_repo.dart';
import 'package:e_commerce/domain/repos/user_addresses_repos/user_addresses_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserAddressesRepo)
class UserAddressesRepoImpl extends UserAddressesRepo {

  UserAddressesRepoDS userAddressesRepoDS;

  UserAddressesRepoImpl(this.userAddressesRepoDS);

  @override
  Future<Either<String, AddressesResponse>> getUserAddresses() async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return userAddressesRepoDS.getUserAddresses();
    }
    else{
      return const Left("Please check your internet connection and try again later");
    }
  }

  @override
  Future<Either<String, AddressesResponse>> deleteUserAddresses(String addressID) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return userAddressesRepoDS.deleteUserAddresses(addressID);
    }
    else{
      return const Left("Please check your internet connection and try again later");
    }
  }

  @override
  Future<Either<String, AddressesResponse>> addUserAddresses(String addressTitle, String addressDetails, city, phoneNumber) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return userAddressesRepoDS.addUserAddresses(addressTitle, addressDetails, city, phoneNumber);
    }
    else{
      return const Left("Please check your internet connection and try again later");
    }
  }

}
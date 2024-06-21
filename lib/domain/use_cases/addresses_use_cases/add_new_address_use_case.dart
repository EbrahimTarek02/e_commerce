import 'package:e_commerce/data/model/addresses_response/addresses_response.dart';
import 'package:e_commerce/domain/repos/user_addresses_repos/user_addresses_repo.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddUserAddressUseCase {
  UserAddressesRepo userAddressesRepo;

  AddUserAddressUseCase(this.userAddressesRepo);

  Future<Either<String, AddressesResponse>> addUserAddress(String addressTitle, String addressDetails, city, phoneNumber) async{
    return await userAddressesRepo.addUserAddresses(addressTitle, addressDetails, city, phoneNumber);
  }
}
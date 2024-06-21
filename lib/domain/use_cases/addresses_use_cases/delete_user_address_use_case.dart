import 'package:e_commerce/data/model/addresses_response/addresses_response.dart';
import 'package:e_commerce/domain/repos/user_addresses_repos/user_addresses_repo.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteUserAddressesUseCase {
  UserAddressesRepo userAddressesRepo;

  DeleteUserAddressesUseCase(this.userAddressesRepo);

  Future<Either<String, AddressesResponse>> execute(String addressID) async {
    return await userAddressesRepo.deleteUserAddresses(addressID);
  }
}

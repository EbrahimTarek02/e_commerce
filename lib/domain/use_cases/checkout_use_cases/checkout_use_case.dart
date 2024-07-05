import 'package:e_commerce/data/model/orders_response/checkout_response.dart';
import 'package:e_commerce/domain/repos/checkout_repos/checkout_repo.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckoutUseCase {
  CheckoutRepo checkoutRepo;

  CheckoutUseCase(this.checkoutRepo);

  Future<Either<String, CheckoutResponse>> execute(String cartID, String addressDetails, String addressPhoneNumber, String city) {
    return checkoutRepo.checkout(cartID, addressDetails, addressPhoneNumber, city);
  }
}
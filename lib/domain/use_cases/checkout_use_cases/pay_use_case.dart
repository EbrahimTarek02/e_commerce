import 'package:e_commerce/domain/repos/checkout_repos/checkout_repo.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class PayUseCase {
  CheckoutRepo checkoutRepo;

  PayUseCase(this.checkoutRepo);

  Future<Either<String, String>> execute(int totalPrice, int integrationID) async{
    return await checkoutRepo.pay(totalPrice, integrationID);
  }
}
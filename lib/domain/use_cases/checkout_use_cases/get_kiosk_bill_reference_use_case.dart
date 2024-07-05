import 'package:e_commerce/domain/repos/checkout_repos/checkout_repo.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetKioskBillReferenceUseCase {
  CheckoutRepo checkoutRepo;

  GetKioskBillReferenceUseCase(this.checkoutRepo);

  Future<Either<String, String>> execute(String paymentToken) async{
    return await checkoutRepo.getKioskBillReference(paymentToken);
  }
}
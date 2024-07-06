import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/data/model/checkout_response/checkout_response.dart';
import 'package:e_commerce/domain/repos/checkout_repos/checkout_repo.dart';
import 'package:e_commerce/domain/repos/checkout_repos/checkout_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CheckoutRepo)
class CheckoutRepoImpl extends CheckoutRepo {

  CheckoutRepoDS checkoutRepoDS;

  CheckoutRepoImpl(this.checkoutRepoDS);

  @override
  Future<Either<String, CheckoutResponse>> checkout(String cartID, String addressDetails, String addressPhoneNumber, String city) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return checkoutRepoDS.checkout(cartID, addressDetails, addressPhoneNumber, city);
    }
    else{
      return const Left("Please check your internet connection and try again later");
    }
  }

  @override
  Future<Either<String, String>> pay(int totalPrice, int integrationID) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return checkoutRepoDS.pay(totalPrice, integrationID);
    }
    else{
      return const Left("Please check your internet connection and try again later");
    }
  }

  @override
  Future<Either<String, String>> getKioskBillReference(String paymentToken) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return checkoutRepoDS.getKioskBillReference(paymentToken);
    }
    else{
      return const Left("Please check your internet connection and try again later");
    }
  }

}
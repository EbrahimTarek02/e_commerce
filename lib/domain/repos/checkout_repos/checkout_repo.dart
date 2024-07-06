import 'package:e_commerce/data/model/checkout_response/checkout_response.dart';
import 'package:either_dart/either.dart';

abstract class CheckoutRepo {
  Future<Either<String, CheckoutResponse>> checkout(String cartID, String addressDetails, String addressPhoneNumber, String city);

  Future<Either<String, String>> pay(int totalPrice, int integrationID);

  Future<Either<String, String>> getKioskBillReference(String paymentToken);
}
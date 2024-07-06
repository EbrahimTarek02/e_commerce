import 'dart:convert';
import 'package:e_commerce/data/model/checkout_response/checkout_response.dart';
import 'package:e_commerce/data/utils/shared_prefs_utils.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/domain/repos/checkout_repos/checkout_repo_ds.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CheckoutRepoDS)
class CheckoutRepoDSImpl extends CheckoutRepoDS {
  @override
  Future<Either<String, CheckoutResponse>> checkout(String cartID, String addressDetails, String addressPhoneNumber, String city) async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/orders/$cartID";

    try {
      Uri uri = Uri.https(baseUrl, endPoint);

      SharedPrefsUtils sharedPrefsUtils = getIt<SharedPrefsUtils>();
      String? userToken = await sharedPrefsUtils.getToken();

      String body = jsonEncode({
        "shippingAddress": {
          "details": addressDetails,
          "phone": addressPhoneNumber,
          "city": city
        }
      });

      Response response = await post(
        uri,
        headers: {
          "token" : userToken!,
          "Content-Type": "application/json"
        },
        body: body
      );

      CheckoutResponse checkoutResponse = CheckoutResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(checkoutResponse);
      }
      else {
        return Left(checkoutResponse.message ?? "Something went wrong please try again later");
      }
    } catch(_) {
      return const Left("Something went wrong please try again later");
    }
  }

  @override
  Future<Either<String, String>> pay(int totalPrice, int integrationID) async{
    String baseUrl = "accept.paymob.com";
    String endPoint = "api/auth/tokens";

    try {
      Uri uri = Uri.https(baseUrl, endPoint);

      String requestBody = jsonEncode({
        "api_key": Constants.apiKey,
      });

      Response response = await post(
          uri,
          headers: {
            'Content-Type': 'application/json',
          },
          body: requestBody
      );

      Map<String, dynamic> paymentAuthResponse = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        String authToken = paymentAuthResponse["token"];

        endPoint = "api/ecommerce/orders";

        Uri uri = Uri.https(baseUrl, endPoint);

        String requestBody = jsonEncode({
          "auth_token": authToken,
          "delivery_needed": "false",
          "amount_cents": (totalPrice * 100).toString(),
          "currency": "EGP",
          "items": [],
        });

        Response response = await post(
          uri,
          headers: {
            'Content-Type': 'application/json',
          },
          body: requestBody
        );

        Map<String, dynamic> paymentOrderResponse = jsonDecode(response.body);

        if (response.statusCode >= 200 && response.statusCode < 300) {
          int orderId = paymentOrderResponse["id"];

          endPoint = "api/acceptance/payment_keys";

          Uri uri = Uri.https(baseUrl, endPoint);

          String requestBody = jsonEncode({
            "auth_token": authToken,
            "amount_cents": (totalPrice * 100).toString(),
            "expiration": 3600,
            "order_id": orderId.toString(),
            "billing_data": {
              "apartment": "NA",
              "email": "ebrahimtarek2002@outlook.com",
              "floor": "NA",
              "first_name": "Ebrahim",
              "street": "NA",
              "building": "NA",
              "phone_number": "01122935123",
              "shipping_method": "NA",
              "postal_code": "NA",
              "city": "NA",
              "country": "NA",
              "last_name": "Tarek",
              "state": "NA"
            },
            "currency": "EGP",
            "integration_id": integrationID
          });

          Response response = await post(
              uri,
              headers: {
                'Content-Type': 'application/json',
              },
              body: requestBody
          );

          Map<String, dynamic> paymentKeyRequestResponse = jsonDecode(response.body);

          if (response.statusCode >= 200 && response.statusCode < 300) {
            return Right(paymentKeyRequestResponse["token"]);
          }
          else {
            return const Left("Something went wrong please try again later");
          }

        }
        else {
          return const Left("Something went wrong please try again later");
        }
      }

      else {
        return const Left("Something went wrong please try again later");
      }
    } catch(_) {
      return const Left("Something went wrong please try again later");
    }
  }

  @override
  Future<Either<String, String>> getKioskBillReference(String paymentToken) async{
    String baseUrl = "accept.paymob.com";
    String endPoint = "api/acceptance/payments/pay";

    try {
      Uri uri = Uri.https(baseUrl, endPoint);

      String requestBody = jsonEncode({
        "source": {
          "identifier": "AGGREGATOR",
          "subtype": "AGGREGATOR"
        },
        "payment_token": paymentToken
      });

      Response response = await post(
          uri,
          headers: {
            'Content-Type': 'application/json',
          },
          body: requestBody
      );

      Map<String, dynamic> kioskResponse = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(kioskResponse["id"].toString());
      }

      else {
        return const Left("Something went wrong please try again later");
      }
    } catch(_) {
      return const Left("Something went wrong please try again later");
    }
  }

}
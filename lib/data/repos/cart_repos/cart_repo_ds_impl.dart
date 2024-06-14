import 'dart:convert';

import 'package:e_commerce/data/model/cart_response/cart_response_DM.dart';
import 'package:e_commerce/data/utils/shared_prefs_utils.dart';
import 'package:e_commerce/domain/repos/cart_repos/cart_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepoDS)
class CartRepoDSImpl extends CartRepoDS {
  @override
  Future<Either<String, CartResponseDm>> getCart() async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/cart";

    try {

      SharedPrefsUtils sharedPrefsUtils = SharedPrefsUtils();
      String? token = await sharedPrefsUtils.getToken();

      Uri uri = Uri.https(baseUrl, endPoint);

      Response response = await get(
        uri,
        headers: {
          "token" : token!
        }
      );

      CartResponseDm cartResponseDm = CartResponseDm.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponseDm);
      }
      else {
        if (cartResponseDm.message?.substring(0, 7) == "No cart") {
          return Right(CartResponseDm(cart: Cart(cartProducts: [])));
        }
        else {
          return Left(cartResponseDm.message ?? "Something went wrong please try again latter");
        }
      }
    }
    catch (_) {
      return const Left("Something went wrong please try again latter");
    }
  }

  @override
  Future<Either<String, CartResponseDm>> addToCart(String productID) async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/cart";

    try {

      SharedPrefsUtils sharedPrefsUtils = SharedPrefsUtils();
      String? token = await sharedPrefsUtils.getToken();

      Uri uri = Uri.https(baseUrl, endPoint);

      Response response = await post(
          uri,
          body: {
            "productId" : productID
          },
          headers: {
            "token" : token!
          }
      );


      CartResponseDm cartResponseDm = CartResponseDm.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponseDm);
      }
      else {
        return Left(cartResponseDm.message ?? "Something went wrong please try again latter");
      }
    }
    catch (_) {
      return const Left("Something went wrong please try again latter");
    }
  }

  @override
  Future<Either<String, CartResponseDm>> removeFromCart(String productID) async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/cart/$productID";

    try {

      SharedPrefsUtils sharedPrefsUtils = SharedPrefsUtils();
      String? token = await sharedPrefsUtils.getToken();

      Uri uri = Uri.https(baseUrl, endPoint);

      Response response = await delete(
          uri,
          headers: {
            "token" : token!
          }
      );

      CartResponseDm cartResponseDm = CartResponseDm.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponseDm);
      }
      else {
        return Left(cartResponseDm.message ?? "Something went wrong please try again latter");
      }
    }
    catch (_) {
      return const Left("Something went wrong please try again latter");
    }
  }

  @override
  Future<Either<String, CartResponseDm>> updateProductInCart(String productID, int productCount) async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/cart/$productID";

    try {

      SharedPrefsUtils sharedPrefsUtils = SharedPrefsUtils();
      String? token = await sharedPrefsUtils.getToken();

      Uri uri = Uri.https(baseUrl, endPoint);

      Response response = await put(
          uri,
          headers: {
            "token" : token!
          },
          body: {
            "count" : productCount.toString()
          }
      );

      CartResponseDm cartResponseDm = CartResponseDm.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponseDm);
      }
      else {
        return Left(cartResponseDm.message ?? "Something went wrong please try again latter");
      }
    }
    catch (_) {
      return const Left("Something went wrong please try again latter");
    }
  }
}
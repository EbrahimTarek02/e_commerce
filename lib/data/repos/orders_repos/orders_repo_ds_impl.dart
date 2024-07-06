import 'dart:convert';
import 'package:e_commerce/data/model/authentication_response/authentication_response.dart' as user_prfs;
import 'package:e_commerce/data/model/order_response/order_response.dart';
import 'package:e_commerce/data/utils/shared_prefs_utils.dart';
import 'package:e_commerce/domain/repos/orders_repo/orders_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrdersRepoDs)
class OrdersRepoDsImpl extends OrdersRepoDs {
  @override
  Future<Either<String, OrderResponse>> getUserOrders() async{
    String baseUrl = "ecommerce.routemisr.com";

    try {

      SharedPrefsUtils sharedPrefsUtils = SharedPrefsUtils();
      user_prfs.User? user = await sharedPrefsUtils.getUser();

      String endPoint = "api/v1/orders/user/${user!.role}";


      Uri uri = Uri.https(baseUrl, endPoint);

      Response response = await get(uri);

      OrderResponse orderResponse = OrderResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(orderResponse);
      }
      else {
          return const Left("Something went wrong please try again latter");
      }
    }
    catch (_) {
      return const Left("Something went wrong please try again latter");
    }
  }

}
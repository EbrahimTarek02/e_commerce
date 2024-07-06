import 'package:e_commerce/data/model/order_response/order_response.dart';
import 'package:either_dart/either.dart';

abstract class OrdersRepoDs {
  Future<Either<String, OrderResponse>> getUserOrders();
}
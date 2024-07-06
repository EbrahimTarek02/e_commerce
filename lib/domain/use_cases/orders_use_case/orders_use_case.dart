import 'package:e_commerce/data/model/order_response/order_response.dart';
import 'package:e_commerce/domain/repos/orders_repo/orders_repo.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrdersUseCase {
  OrdersRepo ordersRepo;

  OrdersUseCase(this.ordersRepo);

  Future<Either<String, OrderResponse>> execute() async {
    return await ordersRepo.getUserOrders();
  }
}
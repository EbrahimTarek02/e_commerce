import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/data/model/order_response/order_response.dart';
import 'package:e_commerce/domain/repos/orders_repo/orders_repo.dart';
import 'package:e_commerce/domain/repos/orders_repo/orders_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrdersRepo)
class OrdersRepoImpl extends OrdersRepo {

  OrdersRepoDs ordersRepoDs;

  OrdersRepoImpl(this.ordersRepoDs);

  @override
  Future<Either<String, OrderResponse>> getUserOrders() async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return ordersRepoDs.getUserOrders();
    }
    else{
      return const Left("Please check your internet connection and try again later");
    }
  }

}
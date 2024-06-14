import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/data/model/cart_response/cart_response_DM.dart';
import 'package:e_commerce/domain/repos/cart_repos/cart_repo.dart';
import 'package:e_commerce/domain/repos/cart_repos/cart_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepo)
class CartRepoImpl extends CartRepo {

  CartRepoDS cartRepoDS;

  CartRepoImpl(this.cartRepoDS);

  @override
  Future<Either<String, CartResponseDm>> getCart() async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return cartRepoDS.getCart();
    }
    else{
      return const Left("Please check your internet connection and try again later");
    }
  }

  @override
  Future<Either<String, CartResponseDm>> addToCart(String productID) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return cartRepoDS.addToCart(productID);
    }
    else{
      return const Left("Please check your internet connection and try again later");
    }
  }

  @override
  Future<Either<String, CartResponseDm>> removeFromCart(String productID) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return cartRepoDS.removeFromCart(productID);
    }
    else{
      return const Left("Please check your internet connection and try again later");
    }
  }

  @override
  Future<Either<String, CartResponseDm>> updateProductInCart(String productID, int productCount) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return cartRepoDS.updateProductInCart(productID, productCount);
    }
    else{
      return const Left("Please check your internet connection and try again later");
    }
  }

}
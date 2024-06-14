import 'package:e_commerce/data/model/cart_response/cart_response_DM.dart';
import 'package:either_dart/either.dart';

abstract class CartRepo {
  Future<Either<String, CartResponseDm>> getCart();

  Future<Either<String, CartResponseDm>> addToCart(String productID);

  Future<Either<String, CartResponseDm>> removeFromCart(String productID);

  Future<Either<String, CartResponseDm>> updateProductInCart(String productID, int productCount);
}
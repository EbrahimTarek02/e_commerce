import 'package:e_commerce/data/model/cart_response/cart_response_DM.dart';
import 'package:e_commerce/domain/repos/cart_repos/cart_repo.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveFromCartUseCase{

  CartRepo cartRepo;

  RemoveFromCartUseCase(this.cartRepo);

  Future<Either<String, CartResponseDm>> execute(String productID) async{
    return await cartRepo.removeFromCart(productID);
  }
}
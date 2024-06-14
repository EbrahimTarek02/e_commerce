import 'package:e_commerce/data/model/cart_response/cart_response_DM.dart';
import 'package:e_commerce/domain/repos/cart_repos/cart_repo.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartUseCase{

  CartRepo cartRepo;

  GetCartUseCase(this.cartRepo);

  Future<Either<String, CartResponseDm>> getCart() async{
    return await cartRepo.getCart();
  }
}
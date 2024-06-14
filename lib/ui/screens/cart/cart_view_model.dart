import 'package:e_commerce/data/model/cart_response/cart_response_DM.dart';
import 'package:e_commerce/domain/use_cases/cart_use_cases/update_product_in_cart_use_case.dart';
import 'package:e_commerce/ui/screens/cart/cart_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit<CartStates>{

  UpdateProductInCartUseCase updateProductInCartUseCase;

  CartViewModel(this.updateProductInCartUseCase) : super(CartInitialState());

  late num totalPrice = 0;

  void reducePrice(num productPrice) {
    totalPrice -= productPrice;
    emit(CounterState());
  }

  void increasePrice(num productPrice) {
    totalPrice += productPrice;
    emit(CounterState());
  }

  static Map<String, int> updatedProducts = {};

  void updateCartCounter() async{

    bool errorState = false;

    emit(CartLoadingState());

    if (updatedProducts.isEmpty) {
      emit(CartSuccessState());
      return;
    }

    for (String product in updatedProducts.keys) {
      Either<String, CartResponseDm> response = await updateProductInCartUseCase.execute(product, updatedProducts[product]!);
      response.fold((error) {
        errorState = true;
        emit(CartErrorState(error));
      }, (success) {
        if (updatedProducts.keys.last == product) {
          emit(CartSuccessState());
        }
      });
      if (errorState) {
        break;
      }
    }

    updatedProducts.clear();

  }
}
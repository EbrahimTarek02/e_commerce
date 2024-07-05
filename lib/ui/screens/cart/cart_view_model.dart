import 'package:e_commerce/data/model/cart_response/cart_response_DM.dart';
import 'package:e_commerce/domain/use_cases/cart_use_cases/update_product_in_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/checkout_use_cases/checkout_use_case.dart';
import 'package:e_commerce/ui/screens/cart/cart_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit<CartStates>{

  UpdateProductInCartUseCase updateProductInCartUseCase;
  CheckoutUseCase checkoutUseCase;

  CartViewModel(this.updateProductInCartUseCase, this.checkoutUseCase) : super(CartInitialState());

  late num subTotalPrice = 0;
  late bool popBack;

  void reducePrice(num productPrice) {
    subTotalPrice -= productPrice;
    emit(CounterState());
  }

  void increasePrice(num productPrice) {
    subTotalPrice += productPrice;
    emit(CounterState());
  }

  static Map<String, int> updatedProducts = {};

  Future<void> updateCartCounter(bool pop) async{
    emit(CartLoadingState());

    popBack = pop;
    bool errorState = false;

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

  String calculateShippingPrice() {
    double shippingPrice = (0.02 * subTotalPrice);
    return shippingPrice < 50 ? "50" : shippingPrice.toStringAsFixed(2);
  }

  String calculateTotalPrice() {
    return (subTotalPrice + double.parse(calculateShippingPrice())).toStringAsFixed(2);
  }

  int calculateDashCount (BoxConstraints constraints) {
    final boxWidth = constraints.constrainWidth();
    final dashCount = (boxWidth / (1.5 * 10)).floor();
    return dashCount;
  }
}
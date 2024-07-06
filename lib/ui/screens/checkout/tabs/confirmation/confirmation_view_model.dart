import 'package:e_commerce/data/model/checkout_response/checkout_response.dart';
import 'package:e_commerce/domain/use_cases/checkout_use_cases/checkout_use_case.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/confirmation/confirmation_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConfirmationViewModel extends Cubit<ConfirmationStates>{

  CheckoutUseCase checkoutUseCase;

  ConfirmationViewModel(this.checkoutUseCase) : super(ConfirmationLoadingState());

  String calculateCurrentTime () {
    DateTime dateTime = DateTime.now();
    if (dateTime.hour < 12) {
      return "${dateTime.hour}:${dateTime.minute} am";
    }
    else {
      return "${dateTime.hour - 12}:${dateTime.minute} pm";
    }
  }

  String getPaymentMethod (int paymentMethodIndex) {
    if (paymentMethodIndex == 0) {
      return "Master Card";
    }
    else if (paymentMethodIndex == 1) {
      return "Visa";
    }
    else if (paymentMethodIndex == 2) {
      return "Meza";
    }
    else if (paymentMethodIndex == 3) {
      return "Bill reference";
    }
    else {
      return "Cash";
    }
  }

  int calculateDashCount (BoxConstraints constraints) {
    final boxWidth = constraints.constrainWidth();
    final dashCount = (boxWidth / (1.5 * 10)).floor();
    return dashCount;
  }

  String isPaid(int paymentMethodIndex) {
    if (paymentMethodIndex < 3) {
      return "PAID";
    }
    else {
      return "PENDING";
    }
  }

  Future<void> addNewOrder(String cartID, String addressDetails, String addressPhoneNumber, String city) async {
    emit(ConfirmationLoadingState());

    Either<String, CheckoutResponse> response = await checkoutUseCase.execute(cartID, addressDetails, addressPhoneNumber, city);

    response.fold((error) {
      emit(ConfirmationErrorState(error));
    }, (success) {
      emit(ConfirmationSuccessState<CheckoutResponse>(success));
    });
  }
}
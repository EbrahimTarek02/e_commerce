import 'package:e_commerce/domain/use_cases/checkout_use_cases/get_kiosk_bill_reference_use_case.dart';
import 'package:e_commerce/domain/use_cases/checkout_use_cases/pay_use_case.dart';
import 'package:e_commerce/ui/screens/checkout/tabs/payment/payment_states.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentViewModel extends Cubit<PaymentStates> {

  PayUseCase payUseCase;
  GetKioskBillReferenceUseCase getKioskBillReferenceUseCase;
  late int subTotalPrice;

  PaymentViewModel(this.payUseCase, this.getKioskBillReferenceUseCase) : super(PaymentInitialState());

  String calculateShippingPrice() {
    double shippingPrice = (0.02 * subTotalPrice);
    return shippingPrice < 50 ? "50" : shippingPrice.toStringAsFixed(2);
  }

  String calculateTotalPrice() {
    return (subTotalPrice + double.parse(calculateShippingPrice())).toStringAsFixed(2);
  }

  Future<void> payWithCard() async{
    emit(PaymentLoadingState());

    Either<String, String> response = await payUseCase.execute(double.parse(calculateTotalPrice()).ceil(), Constants.cardIntegrationID);

    response.fold((error) {
      emit(PaymentErrorState(error));
    }, (success){
      emit(PaymentSuccessState(success));
    });
  }

  Future<void> payWithKiosk() async{
    emit(PaymentLoadingState());

    Either<String, String> response = await payUseCase.execute(double.parse(calculateTotalPrice()).ceil(), Constants.kioskIntegrationID);

    response.fold((error) {
      emit(PaymentErrorState(error));
    }, (success) async {
      Either<String, String> response = await getKioskBillReferenceUseCase.execute(success);

      response.fold((error){
        emit(PaymentErrorState(error));
      }, (billReference) {
        emit(PaymentSuccessState(billReference));
      });
    });
  }

}
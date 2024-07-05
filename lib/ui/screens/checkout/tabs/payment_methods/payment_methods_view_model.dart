import 'package:e_commerce/ui/screens/checkout/tabs/payment_methods/payment_methods_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentMethodsViewModel extends Cubit<PaymentMethodsStates> {
  PaymentMethodsViewModel() : super (PaymentMethodsInitialState());

  int? currentMethod;

  void changePaymentMethod(int newValue) {
    currentMethod = newValue;
    emit(ChangePaymentMethodState());
  }
}
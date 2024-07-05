import 'package:e_commerce/data/model/addresses_response/addresses_response.dart';
import 'package:e_commerce/ui/screens/checkout/checkout_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckoutViewModel extends Cubit<CheckoutStates> {
  int currentIndex = 0;
  List<String> appBarTextList = ["Shipping", "Payment Methods", "Payment", "Confirmation"];
  Data? shippingAddress;
  int? paymentMethodIndex;
  double maxHeight = 0.0;
  bool scrollable = true;
  bool isPayDone = false;
  bool paymentSuccess = false;
  late int subTotalPrice;
  late String cartID;

  CheckoutViewModel() : super(CheckoutInitialState());

  void changeTabIndex (int newIndex) {
    if (newIndex < 4){
      currentIndex = newIndex;
    }
    emit(ChangeState());
  }

  void changeScrollState() {
    scrollable = !scrollable;
    emit(ChangeState());
  }

  RegExp regex = RegExp(
    r'^https:\/\/accept\.paymobsolutions\.com\/api\/acceptance\/post_pay\?.*?\b(success=true)\b.*$',
    caseSensitive: false,
  );

  void changePaymentState(String paymentResponse) {
    if (regex.hasMatch(paymentResponse)) {
      paymentSuccess = true;
    }
    else {
      paymentSuccess = false;
    }
    emit(ChangeState());
  }

  void changeIsPayDoneState(bool newValue) {
    isPayDone = newValue;
    emit(ChangeState());
  }

  String calculateShippingPrice() {
    double shippingPrice = (0.02 * subTotalPrice);
    return shippingPrice < 50 ? "50" : shippingPrice.toStringAsFixed(2);
  }

  String calculateTotalPrice() {
    return (subTotalPrice + double.parse(calculateShippingPrice()).ceil()).toString();
  }
}
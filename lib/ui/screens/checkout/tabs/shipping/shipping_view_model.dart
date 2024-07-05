import 'package:e_commerce/ui/screens/checkout/tabs/shipping/shipping_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ShippingViewModel extends Cubit<ShippingStates> {

  ShippingViewModel() : super(ShippingInitialState());

  String currentRadioButton = "";

  void changeRadioButtonValue (String newValue) {
    currentRadioButton = newValue;
    emit(ChangeRadioButtonIndexState());
  }
}
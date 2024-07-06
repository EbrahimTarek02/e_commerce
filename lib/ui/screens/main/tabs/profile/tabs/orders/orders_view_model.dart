import 'package:e_commerce/data/model/order_response/order_response.dart';
import 'package:e_commerce/domain/use_cases/orders_use_case/orders_use_case.dart';
import 'package:e_commerce/ui/screens/main/tabs/profile/tabs/orders/orders_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrdersViewModel extends Cubit<OrdersStates> {
  OrdersUseCase ordersUseCase;

  OrdersViewModel(this.ordersUseCase) : super(OrdersLoadingState());

  Future<void> getUserOrders() async {
    emit(OrdersLoadingState());

    Either<String, OrderResponse> response = await ordersUseCase.execute();

    response.fold((error){
      emit(OrdersErrorState(error));
    }, (success){
      emit(OrdersSuccessState(success));
    });
  }

  String reformatDate(String date) {
    String reformattedDate = "";
    List<String> list = date.split('-');

    list[list.length - 1] = list[list.length - 1].substring(0, 2);

    for (int i = 2; i >= 0; i--) {
      reformattedDate += list[i];
      if (i != 0) {
        reformattedDate += "-";
      }
    }

    return reformattedDate;
  }

  String reformatTime(String time) {
    List<String> list = time.split('T');

    list = list[1].split(':');

    int hour = int.parse(list[0]);
    bool isAm = true;

    if (hour > 12) {
      list[0] = (hour - 12).toString();
      isAm = false;
    }

    return "${list[0]}:${list[1]} ${isAm ? "am" : "pm"}";
  }

  int calculateShippingPrice(int subTotalPrice) {
    double shippingPrice = (0.02 * subTotalPrice);
    return shippingPrice < 50 ? 50 : shippingPrice.ceil();
  }

  String calculateTotalPrice(int subTotalPrice) {
    return (subTotalPrice + calculateShippingPrice(subTotalPrice)).toString();
  }

  String isDelivered(String orderDate) {
    DateTime currentDate = DateTime.now();

    orderDate = reformatDate(orderDate);

    List<String> list = orderDate.split('-');

    DateTime date = DateTime(int.parse(list[2]), int.parse(list[1]), int.parse(list[0]));

    Duration difference = currentDate.difference(date);

    if (difference >= const Duration(days: 7)) {
      return "Delivered";
    }
    else {
      return "Arriving in ${7 - difference.inDays} days";
    }
  }
}
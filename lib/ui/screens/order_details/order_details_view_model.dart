import 'package:injectable/injectable.dart';

@injectable
class OrderDetailsViewModel {

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
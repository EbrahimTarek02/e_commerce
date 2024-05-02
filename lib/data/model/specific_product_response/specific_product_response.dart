import 'package:e_commerce/data/model/products_response/products_response.dart';

class SpecificProductResponse {
  SpecificProductResponse({
      this.product,});

  SpecificProductResponse.fromJson(dynamic json) {
    product = json['data'] != null ? Product.fromJson(json['data']) : null;
  }
  Product? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (product != null) {
      map['data'] = product?.toJson();
    }
    return map;
  }

}
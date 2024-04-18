import 'package:e_commerce/data/model/products_response/products_response.dart';

class GetWishListResponse {
  GetWishListResponse({
      this.status, 
      this.count, 
      this.wishList,
      this.message,});

  GetWishListResponse.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      wishList = [];
      json['data'].forEach((v) {
        wishList?.add(Product.fromJson(v));
      });
    }
    message = json['message'];
  }
  String? status;
  int? count;
  List<Product>? wishList;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['count'] = count;
    if (wishList != null) {
      map['data'] = wishList?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}
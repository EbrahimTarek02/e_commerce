import 'package:e_commerce/data/model/products_response/products_response.dart';

class CartResponseDm {
  CartResponseDm({
      this.message, 
      this.status, 
      this.numOfCartItems, 
      this.cart,});

  CartResponseDm.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cart = json['data'] != null ? Cart.fromJson(json['data']) : null;
  }
  String? message;
  String? status;
  int? numOfCartItems;
  Cart? cart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    map['numOfCartItems'] = numOfCartItems;
    if (cart != null) {
      map['data'] = cart?.toJson();
    }
    return map;
  }

}

class Cart {
  Cart({
      this.id, 
      this.cartOwner, 
      this.cartProducts,
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  Cart.fromJson(Map json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      cartProducts = [];
      json['products'].forEach((v) {
        cartProducts?.add(CartProducts.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<CartProducts>? cartProducts;
  String? createdAt;
  String? updatedAt;
  int? v;
  num? totalCartPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (cartProducts != null) {
      map['products'] = cartProducts?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }

}

class CartProducts {
  CartProducts({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  CartProducts.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    if (json['product'] is String) {
      product = json['product'];
    }
    else {
      product = json['product'] != null ? Product.fromJson(json['product']) : null;
    }
    price = json['price'];
  }
  int? count;
  String? id;
  dynamic product;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['price'] = price;
    return map;
  }

}
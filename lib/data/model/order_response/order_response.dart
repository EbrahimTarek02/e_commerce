// class OrderResponse {
//   OrderResponse({
//       this.shippingAddress,
//       this.taxPrice,
//       this.shippingPrice,
//       this.totalOrderPrice,
//       this.paymentMethodType,
//       this.isPaid,
//       this.isDelivered,
//       this.id,
//       this.user,
//       this.cartItems,
//       this.createdAt,
//       this.updatedAt,
//       this.orderID,
//       this.v,});
//
//   OrderResponse.fromJson(dynamic json) {
//     shippingAddress = json['shippingAddress'] != null ? ShippingAddress.fromJson(json['shippingAddress']) : null;
//     taxPrice = json['taxPrice'];
//     shippingPrice = json['shippingPrice'];
//     totalOrderPrice = json['totalOrderPrice'];
//     paymentMethodType = json['paymentMethodType'];
//     isPaid = json['isPaid'];
//     isDelivered = json['isDelivered'];
//     id = json['_id'];
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//     if (json['cartItems'] != null) {
//       cartItems = [];
//       json['cartItems'].forEach((v) {
//         cartItems?.add(CartItems.fromJson(v));
//       });
//     }
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     orderID = json['id'];
//     v = json['__v'];
//   }
//   ShippingAddress? shippingAddress;
//   int? taxPrice;
//   int? shippingPrice;
//   int? totalOrderPrice;
//   String? paymentMethodType;
//   bool? isPaid;
//   bool? isDelivered;
//   String? id;
//   User? user;
//   List<CartItems>? cartItems;
//   String? createdAt;
//   String? updatedAt;
//   int? orderID;
//   int? v;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (shippingAddress != null) {
//       map['shippingAddress'] = shippingAddress?.toJson();
//     }
//     map['taxPrice'] = taxPrice;
//     map['shippingPrice'] = shippingPrice;
//     map['totalOrderPrice'] = totalOrderPrice;
//     map['paymentMethodType'] = paymentMethodType;
//     map['isPaid'] = isPaid;
//     map['isDelivered'] = isDelivered;
//     map['_id'] = id;
//     if (user != null) {
//       map['user'] = user?.toJson();
//     }
//     if (cartItems != null) {
//       map['cartItems'] = cartItems?.map((v) => v.toJson()).toList();
//     }
//     map['createdAt'] = createdAt;
//     map['updatedAt'] = updatedAt;
//     map['id'] = orderID;
//     map['__v'] = v;
//     return map;
//   }
//
// }
//
// class CartItems {
//   CartItems({
//       this.count,
//       this.id,
//       this.product,
//       this.price,});
//
//   CartItems.fromJson(dynamic json) {
//     count = json['count'];
//     id = json['_id'];
//     product = json['product'] != null ? Product.fromJson(json['product']) : null;
//     price = json['price'];
//   }
//   int? count;
//   String? id;
//   Product? product;
//   int? price;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['count'] = count;
//     map['_id'] = id;
//     if (product != null) {
//       map['product'] = product?.toJson();
//     }
//     map['price'] = price;
//     return map;
//   }
//
// }
//
// class Product {
//   Product({
//       this.subcategory,
//       this.ratingsQuantity,
//       this.id,
//       this.title,
//       this.imageCover,
//       this.category,
//       this.brand,
//       this.ratingsAverage,});
//
//   Product.fromJson(dynamic json) {
//     if (json['subcategory'] != null) {
//       subcategory = [];
//       json['subcategory'].forEach((v) {
//         subcategory?.add(Subcategory.fromJson(v));
//       });
//     }
//     ratingsQuantity = json['ratingsQuantity'];
//     id = json['_id'];
//     title = json['title'];
//     imageCover = json['imageCover'];
//     category = json['category'] != null ? Category.fromJson(json['category']) : null;
//     brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
//     ratingsAverage = json['ratingsAverage'];
//   }
//   List<Subcategory>? subcategory;
//   int? ratingsQuantity;
//   String? id;
//   String? title;
//   String? imageCover;
//   Category? category;
//   Brand? brand;
//   double? ratingsAverage;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (subcategory != null) {
//       map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
//     }
//     map['ratingsQuantity'] = ratingsQuantity;
//     map['_id'] = id;
//     map['title'] = title;
//     map['imageCover'] = imageCover;
//     if (category != null) {
//       map['category'] = category?.toJson();
//     }
//     if (brand != null) {
//       map['brand'] = brand?.toJson();
//     }
//     map['ratingsAverage'] = ratingsAverage;
//     return map;
//   }
//
// }
//
// class Brand {
//   Brand({
//       this.id,
//       this.name,
//       this.slug,
//       this.image,});
//
//   Brand.fromJson(dynamic json) {
//     id = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     image = json['image'];
//   }
//   String? id;
//   String? name;
//   String? slug;
//   String? image;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = id;
//     map['name'] = name;
//     map['slug'] = slug;
//     map['image'] = image;
//     return map;
//   }
//
// }
//
// class Category {
//   Category({
//       this.id,
//       this.name,
//       this.slug,
//       this.image,});
//
//   Category.fromJson(dynamic json) {
//     id = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     image = json['image'];
//   }
//   String? id;
//   String? name;
//   String? slug;
//   String? image;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = id;
//     map['name'] = name;
//     map['slug'] = slug;
//     map['image'] = image;
//     return map;
//   }
//
// }
//
// class Subcategory {
//   Subcategory({
//       this.id,
//       this.name,
//       this.slug,
//       this.category,});
//
//   Subcategory.fromJson(dynamic json) {
//     id = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     category = json['category'];
//   }
//   String? id;
//   String? name;
//   String? slug;
//   String? category;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = id;
//     map['name'] = name;
//     map['slug'] = slug;
//     map['category'] = category;
//     return map;
//   }
//
// }
//
// class User {
//   User({
//       this.id,
//       this.name,
//       this.email,
//       this.phone,});
//
//   User.fromJson(dynamic json) {
//     id = json['_id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//   }
//   String? id;
//   String? name;
//   String? email;
//   String? phone;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = id;
//     map['name'] = name;
//     map['email'] = email;
//     map['phone'] = phone;
//     return map;
//   }
//
// }
//
// class ShippingAddress {
//   ShippingAddress({
//       this.details,
//       this.phone,
//       this.city,});
//
//   ShippingAddress.fromJson(dynamic json) {
//     details = json['details'];
//     phone = json['phone'];
//     city = json['city'];
//   }
//   String? details;
//   String? phone;
//   String? city;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['details'] = details;
//     map['phone'] = phone;
//     map['city'] = city;
//     return map;
//   }
//
// }

import 'package:e_commerce/data/model/products_response/products_response.dart';

class OrderResponse {
  List<OrderItemResponse> orders;

  OrderResponse({required this.orders});

  factory OrderResponse.fromJson(List<dynamic> json) {
    List<OrderItemResponse> orders = json.map((item) => OrderItemResponse.fromJson(item)).toList();
    return OrderResponse(orders: orders);
  }
}

class OrderItemResponse {
  ShippingAddress shippingAddress;
  int taxPrice;
  int shippingPrice;
  int totalOrderPrice;
  String paymentMethodType;
  bool isPaid;
  bool isDelivered;
  String id;
  User user;
  List<CartItem> cartItems;
  String createdAt;
  String updatedAt;
  int orderID;
  int v;

  OrderItemResponse({
    required this.shippingAddress,
    required this.taxPrice,
    required this.shippingPrice,
    required this.totalOrderPrice,
    required this.paymentMethodType,
    required this.isPaid,
    required this.isDelivered,
    required this.id,
    required this.user,
    required this.cartItems,
    required this.createdAt,
    required this.updatedAt,
    required this.orderID,
    required this.v,
  });

  factory OrderItemResponse.fromJson(Map<String, dynamic> json) {
    return OrderItemResponse(
      shippingAddress: ShippingAddress.fromJson(json['shippingAddress']),
      taxPrice: json['taxPrice'],
      shippingPrice: json['shippingPrice'],
      totalOrderPrice: json['totalOrderPrice'],
      paymentMethodType: json['paymentMethodType'],
      isPaid: json['isPaid'],
      isDelivered: json['isDelivered'],
      id: json['_id'],
      user: User.fromJson(json['user']),
      cartItems: List<CartItem>.from(json['cartItems'].map((item) => CartItem.fromJson(item))),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      orderID: json['id'],
      v: json['__v'],
    );
  }
}

class ShippingAddress {
  String details;
  String phone;
  String city;

  ShippingAddress({
    required this.details,
    required this.phone,
    required this.city,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return ShippingAddress(
      details: json['details'],
      phone: json['phone'],
      city: json['city'],
    );
  }
}

class User {
  String id;
  String name;
  String email;
  String phone;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}

class CartItem {
  int count;
  String id;
  Product product;
  int price;

  CartItem({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      count: json['count'],
      id: json['_id'],
      product: Product.fromJson(json['product']),
      price: json['price'],
    );
  }
}

class Category {
  String id;
  String name;
  String slug;
  String image;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
}

class Brand {
  String id;
  String name;
  String slug;
  String image;

  Brand({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
}

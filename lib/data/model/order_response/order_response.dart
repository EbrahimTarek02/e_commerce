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

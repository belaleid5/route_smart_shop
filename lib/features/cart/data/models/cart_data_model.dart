import 'package:route_smart/core/helper/json_reader.dart';

import 'cart_item_model.dart';

final class CartDataModel {
  const CartDataModel({
    required this.products,
    required this.totalPrice,
    this.id,
    this.userId,
  });

  final String? id;
  final String? userId;
  final List<CartItemModel> products;
  final double totalPrice;

  factory CartDataModel.fromJson(Map<String, dynamic> json) {
    final productsJson = JsonReader.mapList(json['products']);

    return CartDataModel(
      id: JsonReader.nullableString(json['_id'] ?? json['id']),
      userId: JsonReader.nullableString(json['cartOwner'] ?? json['userId']),
      products: productsJson
          .map(CartItemModel.fromJson)
          .toList(growable: false),
      totalPrice: JsonReader.decimal(
        json['totalCartPrice'] ?? json['totalPrice'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) '_id': id,
      if (userId != null) 'cartOwner': userId,
      'products': products.map((product) => product.toJson()).toList(),
      'totalCartPrice': totalPrice,
    };
  }
}

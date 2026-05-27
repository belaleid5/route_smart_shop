import 'package:route_smart/core/helper/json_reader.dart';

import 'cart_product_model.dart';

final class CartItemModel {
  const CartItemModel({
    required this.cartItemId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
    this.imageUrl,
  });

  final String cartItemId;
  final String productId;
  final String productName;
  final int quantity;
  final double price;
  final String? imageUrl;

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    final productJson = JsonReader.map(json['product']);
    final product = productJson == null
        ? null
        : CartProductModel.fromJson(productJson);

    final rawProduct = json['product'];

    final fallbackProductId = JsonReader.string(
      json['productId'] ?? (rawProduct is String ? rawProduct : null),
    );

    return CartItemModel(
      cartItemId: JsonReader.string(json['_id'] ?? json['cartItemId']),
      productId: product?.id.isNotEmpty == true ? product!.id : fallbackProductId,
      productName: product?.title.isNotEmpty == true
          ? product!.title
          : JsonReader.string(json['productName'] ?? json['title']),
      quantity: JsonReader.integer(json['count'] ?? json['quantity']),
      price: JsonReader.decimal(
        json['price'],
        fallback: product?.price ?? 0,
      ),
      imageUrl: product?.imageUrl ??
          JsonReader.nullableString(
            json['imageUrl'] ?? json['imageCover'],
          ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': cartItemId,
      'productId': productId,
      'productName': productName,
      'count': quantity,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  CartItemModel copyWith({
    int? quantity,
  }) {
    return CartItemModel(
      cartItemId: cartItemId,
      productId: productId,
      productName: productName,
      quantity: quantity ?? this.quantity,
      price: price,
      imageUrl: imageUrl,
    );
  }
}

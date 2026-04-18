import 'package:json_annotation/json_annotation.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel {
  @JsonKey(name: '_id')
  final String cartItemId;

  final String productId;
  final String productName;

  @JsonKey(name: 'count')
  final int quantity;

  final double price;
  final String? imageUrl;

  const CartItemModel({
    required this.cartItemId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
    this.imageUrl,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    final productData = json['product'] as Map<String, dynamic>?;

    return CartItemModel(
      cartItemId: json['_id'] as String? ?? '',
      productId: productData?['_id'] as String? ?? '',
      productName: productData?['title'] as String? ?? '',
      quantity: json['count'] as int? ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      imageUrl: productData?['imageCover'] as String?,
    );
  }

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);

  CartItemModel copyWith({int? quantity}) {
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
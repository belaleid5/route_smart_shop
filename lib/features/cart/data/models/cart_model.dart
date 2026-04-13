import 'package:json_annotation/json_annotation.dart';

import 'cart_item_model.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class Cart {
  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: 'cartOwner')
  final String userId;

  @JsonKey(name: 'products')
  final List<CartItemModel> items;

  @JsonKey(name: 'totalCartPrice')
  final double totalPrice;

  const Cart({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalPrice,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    // Handle nested data object from API response
    final data = json['data'] as Map<String, dynamic>?;

    if (data != null) {
      return _$CartFromJson(data);
    }

    return _$CartFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CartToJson(this);
}

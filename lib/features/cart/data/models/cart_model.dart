import 'package:route_smart/core/helper/json_reader.dart';

import 'cart_item_model.dart';

// Note: Class name kept as `Cart` to avoid breaking existing code.
// Consider renaming to `CartModel` in a future refactor.
final class Cart {
  const Cart({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalPrice,
  });

  final String id;
  final String userId;
  final List<CartItemModel> items;
  final double totalPrice;

  factory Cart.fromJson(Map<String, dynamic> json) {
    final dataJson = JsonReader.map(json['data']);
    final source = dataJson ?? json;

    final itemsJson = JsonReader.mapList(
      source['products'] ?? source['items'],
    );

    return Cart(
      id: JsonReader.string(
        source['_id'] ?? source['id'] ?? json['cartId'],
      ),
      userId: JsonReader.string(
        source['cartOwner'] ?? source['userId'],
      ),
      items: itemsJson.map(CartItemModel.fromJson).toList(growable: false),
      totalPrice: JsonReader.decimal(
        source['totalCartPrice'] ?? source['totalPrice'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'cartOwner': userId,
      'products': items.map((item) => item.toJson()).toList(),
      'totalCartPrice': totalPrice,
    };
  }
}

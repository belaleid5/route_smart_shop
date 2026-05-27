import 'package:route_smart/features/cart/domain/entites/cart_item_entity.dart';

final class CartEntity {
  const CartEntity({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalPrice,
  });

  final String id;
  final String userId;
  final List<CartItemEntity> items;
  final double totalPrice;
}
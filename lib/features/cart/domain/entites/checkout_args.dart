import 'package:route_smart/features/cart/domain/entites/cart_item_entity.dart';

final class CheckoutRouteArgs {
  const CheckoutRouteArgs({
    required this.cartId,
    required this.cartItems,
    required this.totalPrice,
  });

  final String cartId;
  final List<CartItemEntity> cartItems;
  final double totalPrice;
}

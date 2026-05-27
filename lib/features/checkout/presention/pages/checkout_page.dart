import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/features/cart/domain/entites/cart_item_entity.dart';
import 'package:route_smart/features/checkout/presention/refactors/checkout_body.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({
    super.key,
    required this.cartId,
    required this.cartItems,
    required this.totalPrice,
    required this.customerEmail,
  });

  final String cartId;
  final List<CartItemEntity> cartItems;
  final double totalPrice;
  final String customerEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: CheckoutBody(
        cartId: cartId,
        cartItems: cartItems,
        totalPrice: totalPrice,
      ),
    );
  }
}
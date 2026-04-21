import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/cart/data/models/cart_item_model.dart';
// ✅ أضف الـ Import ده
import 'package:route_smart/features/checkout/presention/refactors/checkout_body.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({
    super.key,
    required this.cartId,
    required this.cartItems,
    required this.totalPrice,
  });

  final String cartId;
  final List<CartItemModel> cartItems;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.background,
      body: CheckoutBody(
        cartId: cartId,
        cartItems: cartItems,
        totalPrice: totalPrice,
      ),
    );
  }
}
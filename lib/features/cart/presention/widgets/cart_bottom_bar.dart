import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/cart/presention/widgets/checkout_button.dart';
import 'package:route_smart/features/cart/presention/widgets/total_price_column.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({super.key, required this.totalPrice});

  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: context.color.shades,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 20,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: Row(
        children: [
          TotalPriceColumn(totalPrice: totalPrice),
          const SizedBox(width: 16),
          Expanded(child: CheckoutButton(onTap: () {})),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_quantity_control.dart';

class CartItemInfo extends StatelessWidget {
  const CartItemInfo({
    super.key,
    required this.title,
    required this.price,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });

  final String title;
  final double price;
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.textStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: context.color.textPrimary,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: context.textStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: context.color.button,
              ),
            ),
            const Spacer(),
            CartQuantityControl(
              count: count,
              onIncrement: onIncrement,
              onDecrement: onDecrement,
            ),
          ],
        ),
      ],
    );
  }
}
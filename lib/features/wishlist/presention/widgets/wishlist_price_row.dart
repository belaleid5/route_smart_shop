// lib/features/wishlist/presentation/widgets/wishlist_price_row.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class WishlistPriceRow extends StatelessWidget {
  const WishlistPriceRow({super.key, required this.price, this.oldPrice});

  final double price;
  final double? oldPrice;

  @override
  Widget build(BuildContext context) {
    final hasDiscount = oldPrice != null;
    return Row(
      children: [
        if (hasDiscount) ...[
          Text(
            '\$${oldPrice!.toStringAsFixed(0)},00',
            style: context.textStyle.copyWith(
              fontSize: 15,
              color: context.color.primary,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(width: 8),
        ],
        Text(
          '\$${price.toStringAsFixed(0)},00',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

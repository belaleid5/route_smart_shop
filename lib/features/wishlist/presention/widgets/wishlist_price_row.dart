// lib/features/wishlist/presentation/widgets/wishlist_price_row.dart

import 'package:flutter/material.dart';

class WishlistPriceRow extends StatelessWidget {
  const WishlistPriceRow({
    super.key,
    required this.price,
    this.oldPrice,
  });

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
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFFFF5A7A),
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

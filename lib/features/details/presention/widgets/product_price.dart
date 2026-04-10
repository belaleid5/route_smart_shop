// lib/features/product_details/presentation/widgets/product_price.dart

import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.price,
    this.priceAfterDiscount,
  });

  final double price;
  final double? priceAfterDiscount;

  bool get _hasDiscount =>
      priceAfterDiscount != null && priceAfterDiscount! < price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$${(_hasDiscount ? priceAfterDiscount! : price).toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Color(0xFF2563EB),
          ),
        ),
        if (_hasDiscount) ...[
          const SizedBox(width: 10),
          Text(
            '\$${price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ],
    );
  }
}

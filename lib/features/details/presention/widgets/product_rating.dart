// lib/features/product_details/presentation/widgets/product_rating.dart

import 'package:flutter/material.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({
    super.key,
    required this.rating,
    required this.count,
  });

  final double rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star_rounded, color: Colors.amber, size: 22),
        const SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(width: 4),
        Text(
          '($count reviews)',
          style: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ],
    );
  }
}

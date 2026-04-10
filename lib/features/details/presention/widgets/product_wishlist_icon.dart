// lib/features/product_details/presentation/widgets/product_wishlist_icon.dart

import 'package:flutter/material.dart';

class ProductWishlistIcon extends StatelessWidget {
  const ProductWishlistIcon({super.key, required this.isLoading});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }
    return const Icon(Icons.favorite, color: Color(0xFF2563EB));
  }
}

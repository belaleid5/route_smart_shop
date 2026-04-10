// lib/features/wishlist/presentation/widgets/wishlist_add_to_cart_button.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class WishlistAddToCartButton extends StatelessWidget {
  const WishlistAddToCartButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          border: Border.all(color: context.color.primary, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.add_shopping_cart_outlined,
          size: 20,
          color: context.color.primary,
        ),
      ),
    );
  }
}

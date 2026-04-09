import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class ProductWishlistButton extends StatelessWidget {
  const ProductWishlistButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: context.color.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: context.color.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        Icons.favorite_border_rounded,
        size: 16,
        color: context.color.textSecondary,
      ),
    );
  }
}

// lib/features/wishlist/presentation/widgets/wishlist_circle_icon_button.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class WishlistCircleIconButton extends StatelessWidget {
  const WishlistCircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: context.color.primary,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}

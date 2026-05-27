import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class FavoriteIcon extends StatelessWidget {
  final bool isFavorite;

  const FavoriteIcon({super.key, this.isFavorite = false});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: CircleAvatar(
        radius: 16,
        backgroundColor: context.colors.white.withOpacity(0.9),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          size: 18,
          color: isFavorite ? Colors.red : context.colors.textSecondary,
        ),
      ),
    );
  }
}

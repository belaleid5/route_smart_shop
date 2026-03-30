import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: CircleAvatar(
        backgroundColor: context.color.white,
        radius: 14,
        child: Icon(
          Icons.favorite_border,
          size: 16,
          color: context.color.textSecondary,
        ),
      ),
    );
  }
}

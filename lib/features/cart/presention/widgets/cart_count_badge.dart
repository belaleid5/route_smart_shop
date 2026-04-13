import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class CartCountBadge extends StatelessWidget {
  const CartCountBadge({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: context.color.button.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        '$count',
        style: context.textStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: context.color.textPrimary,
        ),
      ),
    );
  }
}
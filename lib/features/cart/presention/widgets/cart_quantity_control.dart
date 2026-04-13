import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/cart/presention/widgets/quantity_button.dart';

class CartQuantityControl extends StatelessWidget {
  const CartQuantityControl({
    super.key,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuantityButton(icon: Icons.remove, onTap: onDecrement),
        const SizedBox(width: 8),
        SizedBox(
          width: 36,
          height: 36,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: FadeTransition(opacity: animation, child: child),
            ),
            child: Container(
              key: ValueKey(count),
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: context.color.button.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                '$count',
                style: context.textStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: context.color.textPrimary,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        QuantityButton(icon: Icons.add, onTap: onIncrement),
      ],
    );
  }
}


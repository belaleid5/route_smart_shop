import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class TotalPriceColumn extends StatelessWidget {
  const TotalPriceColumn({super.key, required this.totalPrice});

  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.translate('total'),
          style: context.textStyle.copyWith(
            fontSize: 12,
            color: context.color.textPrimary.withOpacity(0.6),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.5),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          ),
          child: Text(
            '\$${totalPrice.toStringAsFixed(2)}',
            key: ValueKey(totalPrice),
            style: context.textStyle.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: context.color.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
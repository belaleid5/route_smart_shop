import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class TotalPriceColumn extends StatelessWidget {
  const TotalPriceColumn({
    super.key,
    required this.totalPrice,
  });

  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.translate(LangKeys.totalAmount),
          style: context.textStyle.copyWith(
            fontSize: 20,
            color: context.colors.textPrimary.withValues(alpha: 0.6),
          ),
        ),
        verticalSpace(2),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.5),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          ),
          child: Text(
            '\$${totalPrice.toStringAsFixed(2)}',
            key: ValueKey(totalPrice),
            style: context.textStyle.copyWith(
              fontSize: 20,
              color: context.colors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
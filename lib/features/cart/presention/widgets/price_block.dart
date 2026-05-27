import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class PriceBlock extends StatelessWidget {
  const PriceBlock({
    super.key,
    required this.price,
    this.oldPrice,
  });

  final double price;
  final double? oldPrice;

  @override
  Widget build(BuildContext context) {
    if (oldPrice == null) {
      return Text(
        '\$${price.toStringAsFixed(2)}',
        style: context.titleMedium.copyWith(
          color: context.colors.button,
        ),
      );
    }

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      children: [
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: context.titleMedium.copyWith(
            color: context.colors.button,
          ),
        ),
        Text(
          '\$${oldPrice!.toStringAsFixed(2)}',
          style: context.textStyle.copyWith(
            fontSize: 16,
            color: context.colors.textSecondary,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }
}

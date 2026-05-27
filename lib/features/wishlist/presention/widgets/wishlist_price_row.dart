import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class WishlistPriceRow extends StatelessWidget {
  const WishlistPriceRow({super.key, required this.price, this.oldPrice});

  final double price;
  final double? oldPrice;

  bool get _hasDiscount =>
      oldPrice != null && oldPrice! > price && oldPrice! != price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (_hasDiscount) ...[
          Text(
            '\$${oldPrice!.toStringAsFixed(0)},00',
            style: context.textStyle.copyWith(
              fontSize: 15,
              color: context.colors.primary,
              decoration: TextDecoration.lineThrough,
              decorationColor: context.colors.primary,
            ),
          ),
          const SizedBox(width: 8),
        ],
        Text(
          '\$${price.toStringAsFixed(0)},00',
          style: context.textStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: context.colors.textPrimary,
          ),
        ),
      ],
    );
  }
}

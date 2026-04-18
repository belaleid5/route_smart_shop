import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class WishlistPriceRow extends StatelessWidget {
  const WishlistPriceRow({
    super.key,
    required this.price,
    this.oldPrice,
  });

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
              color: context.color.primary,
              decoration: TextDecoration.lineThrough,
              decorationColor: context.color.primary,
            ),
          ),
          const SizedBox(width: 8),
        ],
        Text(
          '\$${price.toStringAsFixed(0)},00',
          style: context.textStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: context.color.textPrimary,
          ),
        ),
      ],
    );
  }
}
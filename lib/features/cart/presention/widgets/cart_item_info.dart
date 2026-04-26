import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_quantity_control.dart';

class CartItemInfo extends StatelessWidget {
  const CartItemInfo({
    super.key,
    required this.title,
    required this.price,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
    this.oldPrice,
  });

  final String title;
  final double price;
  final double? oldPrice;
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  bool get _hasDiscount => oldPrice != null && oldPrice! > price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.textStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: context.color.textPrimary,
            height: 1.4,
          ),
        ),
        verticalSpace(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: _PriceBlock(
                price: price,
                oldPrice: _hasDiscount ? oldPrice : null,
              ),
            ),
            CartQuantityControl(
              count: count,
              onIncrement: onIncrement,
              onDecrement: onDecrement,
            ),
          ],
        ),
      ],
    );
  }
}

class _PriceBlock extends StatelessWidget {
  const _PriceBlock({required this.price, this.oldPrice});

  final double price;
  final double? oldPrice;

  @override
  Widget build(BuildContext context) {
    if (oldPrice == null) {
      return Text(
        '\$${price.toStringAsFixed(2)}',
        style: context.textStyle.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: context.color.button,
        ),
      );
    }

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      children: [
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: context.textStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: context.color.button,
          ),
        ),
        Text(
          '\$${oldPrice!.toStringAsFixed(2)}',
          style: context.textStyle.copyWith(
            fontSize: 13,
            color: context.color.textSecondary,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }
}
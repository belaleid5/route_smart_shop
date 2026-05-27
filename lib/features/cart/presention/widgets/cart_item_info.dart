import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_quantity_control.dart';
import 'package:route_smart/features/cart/presention/widgets/price_block.dart';

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
          style: context.bodyMedium.copyWith(
            color: context.colors.textPrimary,
            height: 1.4,
          ),
        ),
        verticalSpace(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PriceBlock(
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

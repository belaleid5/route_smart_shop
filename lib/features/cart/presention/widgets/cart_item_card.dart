import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/cart/domain/entites/cart_item_entity.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_item_image.dart';
import 'package:route_smart/features/cart/presention/widgets/cart_item_info.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onIncrement,
    required this.onDecrement,
  });

  final CartItemEntity item;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: context.colors.textPrimary.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RepaintBoundary(
            child: CartItemImage(
              imageUrl: item.imageUrl ?? '',
              onDelete: onDelete,
            ),
          ),
          horizontalSpace(14),
          Expanded(
            child: CartItemInfo(
              title: item.productName,
              price: item.price,
              count: item.quantity,
              onIncrement: onIncrement,
              onDecrement: onDecrement,
            ),
          ),
        ],
      ),
    );
  }
}

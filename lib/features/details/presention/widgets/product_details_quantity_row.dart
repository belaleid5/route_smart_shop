import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/features/details/presention/widgets/details_quantity_button.dart';

class ProductDetailsQuantityRow extends StatelessWidget {
  const ProductDetailsQuantityRow({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.translate('choose_amount'),
          style: context.textStyle.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: context.colors.textPrimary,
          ),
        ),
        const Spacer(),
        DetailsQuantityButton(
          icon: Icons.remove,
          onTap: onDecrement,
          filled: false,
        ),
        const SizedBox(width: 16),
        Text(
          '$quantity',
          style: context.textStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: context.colors.textPrimary,
          ),
        ),
        const SizedBox(width: 16),
        DetailsQuantityButton(
          icon: Icons.add,
          onTap: onIncrement,
          filled: true,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';


class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80,
            color: context.color.textPrimary,
          ),
          const SizedBox(height: 16),
          Text(
            context.translate('cart_empty'),
            style: context.textStyle.copyWith(
              fontSize: 18,
              color: context.color.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
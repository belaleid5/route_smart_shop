// lib/features/checkout/presention/widgets/checkout_products_section.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/cart/domain/entites/cart_item_entity.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_product_item.dart';

class CheckoutProductsSection extends StatelessWidget {
  const CheckoutProductsSection({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${context.translate(LangKeys.products)} (${cartItems.length})',
          style: context.textStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: context.colors.textPrimary,
          ),
        ),
        verticalSpace(16),
        ...cartItems.map(
          (item) => CheckoutProductItem(
            name: item.productName,
            price: item.price,
            quantity: item.quantity,
            imageUrl: item.imageUrl ?? '',
          ),
        ),
      ],
    );
  }
}

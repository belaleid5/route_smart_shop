import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/cart/data/models/cart_item_model.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_product_item.dart';

class CheckoutProductsSection extends StatelessWidget {
  const CheckoutProductsSection({
    super.key,
    required this.cartItems,
  });

  final List<CartItemModel> cartItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Products (${cartItems.length})',
          style: context.textStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: context.color.textPrimary,
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

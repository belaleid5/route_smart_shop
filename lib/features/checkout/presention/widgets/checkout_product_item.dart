import 'package:flutter/material.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_product_image.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_product_info.dart';
import 'package:route_smart/features/checkout/presention/widgets/checkout_product_price.dart';

class CheckoutProductItem extends StatelessWidget {
  const CheckoutProductItem({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  final String name;
  final double price;
  final int quantity;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          CheckoutProductImage(imageUrl: imageUrl),
          const SizedBox(width: 14),
          Expanded(
            child: CheckoutProductInfo(name: name, quantity: quantity),
          ),
          CheckoutProductPrice(price: price),
        ],
      ),
    );
  }
}

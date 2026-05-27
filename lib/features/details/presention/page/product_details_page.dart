// features/details/presention/pages/product_details_page.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/common/domain/entites/product_entity.dart';
import 'package:route_smart/features/details/presention/refactor/product_details_body.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailsBody(
        productId: product.id,
        initialProduct: product,
      ),
    );
  }
}

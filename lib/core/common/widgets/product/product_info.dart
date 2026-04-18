// lib/core/common/widgets/product_info.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';
import 'package:route_smart/core/common/widgets/product/product_category_label.dart';
import 'package:route_smart/core/common/widgets/product/product_price_and_rating.dart';
import 'package:route_smart/core/common/widgets/product/product_title.dart';
import 'package:route_smart/core/helper/spacing.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key, required this.product});

  final ProductDataModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ProductCategoryLabel(name: product.category?.name),
          verticalSpace( 4),
          Flexible(child: ProductTitle(title: product.title)),
          verticalSpace( 6),
          ProductPriceAndRating(
            price: product.price,
            ratingsAverage: product.ratingsAverage,
          ),
        ],
      ),
    );
  }
}

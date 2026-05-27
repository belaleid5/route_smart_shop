import 'package:flutter/material.dart';
import 'package:route_smart/core/common/domain/entites/product_entity.dart';
import 'package:route_smart/core/common/widgets/product/product_category_label.dart';
import 'package:route_smart/core/common/widgets/product/product_price_and_rating.dart';
import 'package:route_smart/core/common/widgets/product/product_title.dart';
import 'package:route_smart/core/helper/spacing.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          
          ProductCategoryLabel(name: product.title),
          verticalSpace(4),
          Flexible(child: ProductTitle(title: product.title)),
          verticalSpace(6),
          ProductPriceAndRating(
      
            price: product.price, 
            originalPrice: null,  
            ratingsAverage: product.price,
          ),
        ],
      ),
    );
  }
}
// lib/core/common/widgets/grid_view_products.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';
import 'package:route_smart/core/common/widgets/grid_view.dart';
import 'package:route_smart/core/common/widgets/product/product_card_item.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';

class GridViewProducts extends StatelessWidget {
  const GridViewProducts({
    super.key,
    required this.products,
    required this.onProductTap,
    this.onFavoriteTap,                        
    this.hasReachedMax = false,
  });

  final List<ProductDataModel> products;
  final bool hasReachedMax;
  final ValueChanged<ProductDataModel> onProductTap;
  final ValueChanged<ProductDataModel>? onFavoriteTap; 

  @override
  Widget build(BuildContext context) {
    return PaginatedGridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      itemCount: products.length,
      hasMore: hasReachedMax,
      itemBuilder: (context, index) {
        return ProductCardItem(
          product: products[index],
          onTap: () => onProductTap(products[index]),
          onFavoriteTap: () => onFavoriteTap?.call(products[index]), 
          
        ).animateBottomToTop(
          duration: Duration(milliseconds: 300 + (index * 50)),
        );
      },
    );
  }
}
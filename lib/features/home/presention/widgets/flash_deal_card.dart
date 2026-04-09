import 'package:flutter/material.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';
import 'package:route_smart/core/common/widgets/product/product_card_item.dart';

class FlashDealCard extends StatelessWidget {
  const FlashDealCard({super.key, required this.product});
  final ProductDataModel product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 140, child: ProductCardItem(product: product));
  }
}

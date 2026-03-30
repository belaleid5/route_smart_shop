import 'package:flutter/material.dart';
import 'package:route_smart/features/home/data/models/product_data_model.dart';
import 'package:route_smart/features/home/presention/widgets/product_grid_view.dart';

class FlashDealCard extends StatelessWidget {
  const FlashDealCard({super.key,required this.product});
  final ProductDataModel product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 140, child: ProductGridCard(product: product));
  }
}

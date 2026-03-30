import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/home/data/models/product_data_model.dart';
import 'package:route_smart/features/home/presention/widgets/discount_price.dart';
import 'package:route_smart/features/home/presention/widgets/favorite_icon.dart';
import 'package:route_smart/features/home/presention/widgets/image_product.dart';
import 'package:route_smart/features/home/presention/widgets/product_info_item.dart';

class ProductGridCard extends StatelessWidget {
  final ProductDataModel product;

  const ProductGridCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final bool hasDiscount =
        product.priceAfterDiscount != null &&
        product.priceAfterDiscount! < (product.price ?? 0);

    String? calculatedDiscount;
    if (hasDiscount) {
      double percentage =
          ((product.price! - product.priceAfterDiscount!) / product.price!) *
          100;
      calculatedDiscount = percentage.toInt().toString();
    }

    return Container(
      decoration: BoxDecoration(
        color: context.color.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: context.color.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                ImageProduct(imageUrl: product.imageCover),
                const FavoriteIcon(),
                if (hasDiscount)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: DiscountPrice(
                      discountPercentage: calculatedDiscount,
                    ),
                  ),
              ],
            ),
          ),
          ProductInfoItem(
            categoryName: product.category?.name,
            title: product.title,
            price: product.price,
            priceAfterDiscount: product.priceAfterDiscount,
            rating: product.ratingsAverage,
          ),
        ],
      ),
    ).animateBottomToTop(duration: const Duration(milliseconds: 500));
  }
}

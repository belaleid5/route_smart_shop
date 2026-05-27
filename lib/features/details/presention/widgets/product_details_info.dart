import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/details/data/models/product_details_response_model.dart';
import 'package:route_smart/features/details/domain/entites/product_details_entit.dart';
import 'package:route_smart/features/details/presention/widgets/product_description_text.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_brand_row.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_quantity_row.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_rating_row.dart';
import 'package:route_smart/features/details/presention/widgets/wishlist_heart_button.dart';

class ProductDetailsInfo extends StatelessWidget {
  const ProductDetailsInfo({
    super.key,
    required this.product,
    required this.productId,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onToggleWishlist,
  });

   final ProductDetailsEntity product;
  final String productId;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onToggleWishlist;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.shades,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  product.title,
                  style: context.textStyle.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: context.colors.textPrimary,
                  ),
                ).animateRightLeft(isFromStart: false),
              ),
              const SizedBox(width: 12),
              WishlistHeartButton(
                productId: productId,
                onTap: onToggleWishlist,
              ).animateRightLeft(isFromStart: true),
            ],
          ),
          verticalSpace(10),
          ProductDetailsRatingRow(
            rating: product.ratingsAverage,
            reviewCount: product.ratingsQuantity,
          ).animateRightLeft(isFromStart: false),
          verticalSpace(16),
          ProductDescriptionText(
            description: product.description,
          ).animateBottomToTop(),
          verticalSpace(20),
          ProductDetailsBrandRow(
            brand: product.brand,
          ).animateRightLeft(isFromStart: false),
          verticalSpace(24),
          ProductDetailsQuantityRow(
            quantity: quantity,
            onIncrement: onIncrement,
            onDecrement: onDecrement,
          ).animateBottomToTop(),
        ],
      ),
    );
  }
}

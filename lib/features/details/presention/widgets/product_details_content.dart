import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/features/details/domain/entites/product_details_entit.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_app_bar.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_bottom_bar.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_cover_image.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_info.dart';
import 'package:route_smart/features/details/presention/widgets/reviews_section.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({
    super.key,
    required this.product,
    required this.productId,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onToggleWishlist,
    required this.onAddToCart,
  });

  final ProductDetailsEntity product;
  final String productId;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onToggleWishlist;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ProductDetailsCoverImage(
                  imageCover: product.imageCover,
                  images: product.images,
                ).animateBlur(),
              ),
              SliverToBoxAdapter(
                child: ProductDetailsInfo(
                  product: product,
                  productId: productId,
                  quantity: quantity,
                  onIncrement: onIncrement,
                  onDecrement: onDecrement,
                  onToggleWishlist: onToggleWishlist,
                ).animateBottomToTop(),
              ),
              SliverToBoxAdapter(
                child: ReviewsPreviewSection(
                  productId: productId,
                ).animateBottomToTop(),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 120)),
            ],
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ProductDetailsAppBar(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ProductDetailsBottomBar(
              price: product.price ?? 0,
              productId: productId,
              onAddToCart: onAddToCart,
            ).animateBottomToTop(isFromBottom: true),
          ),
        ],
      ),
    );
  }
}

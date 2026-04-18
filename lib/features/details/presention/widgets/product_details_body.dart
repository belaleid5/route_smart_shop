import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/features/details/data/models/product_details_response_model.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_app_bar.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_bottom_bar.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_cover_image.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_info.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({
    super.key,
    required this.product,
    required this.productId,
    required this.onAddToCart,
    required this.onToggleWishlist,
  });

  final ProductDetailsDataModel product;
  final String productId;
  final VoidCallback onAddToCart;
  final VoidCallback onToggleWishlist;

  @override
  State<ProductDetailsBody> createState() => ProductDetailsBodyState();
}

class ProductDetailsBodyState extends State<ProductDetailsBody> {
  int quantity = 1;

  void increment() => setState(() => quantity++);

  void decrement() {
    if (quantity > 1) setState(() => quantity--);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ProductDetailsCoverImage(
                  imageCover: widget.product.imageCover ?? '',
                  images: widget.product.images ?? [],
                ).animateBlur(),
              ),
              SliverToBoxAdapter(
                child: ProductDetailsInfo(
                  product: widget.product,
                  productId: widget.productId,
                  quantity: quantity,
                  onIncrement: increment,
                  onDecrement: decrement,
                  onToggleWishlist: widget.onToggleWishlist,
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
              price: widget.product.price ?? 0,
              productId: widget.productId,
              onAddToCart: widget.onAddToCart,
            ).animateBottomToTop(isFromBottom: true),
          ),
        ],
      ),
    );
  }
}
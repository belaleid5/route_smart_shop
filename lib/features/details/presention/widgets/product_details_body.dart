import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';
import 'package:route_smart/core/extensions/cart_extenions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/extensions/wishlist_extention.dart';
import 'package:route_smart/features/details/presention/manger/product_details_bloc.dart';
import 'package:route_smart/features/details/presention/manger/product_details_state.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_content.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_loading_shimmer.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_bloc.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_state.dart';


class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({
    super.key,
    required this.productId,
    required this.initialProduct,
  });

  final String productId;
  final ProductDataModel initialProduct;

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  int quantity = 1;

  void _increment() {
    setState(() => quantity++);
  }

  void _decrement() {
    if (quantity <= 1) return;

    setState(() => quantity--);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReviewsBloc, ReviewsState>(
      listenWhen: (previous, current) {
        return current.maybeWhen(
          reviewCreated: () => true,
          reviewUpdated: () => true,
          reviewDeleted: () => true,
          actionError: (_) => true,
          orElse: () => false,
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          reviewCreated: () {
            CustomToast.showSuccess(
              context,
              'Review added successfully',
            );
          },
          reviewUpdated: () {
            CustomToast.showSuccess(
              context,
              'Review updated successfully',
            );
          },
          reviewDeleted: () {
            CustomToast.showSuccess(
              context,
              'Review deleted successfully',
            );
          },
          actionError: (message) {
            CustomToast.showError(
              context,
              message,
            );
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const ProductDetailsLoadingShimmer(),

            loading: () => const ProductDetailsLoadingShimmer(),

            success: (product) {
              return ProductDetailsContent(
                product: product,
                productId: widget.productId,
                quantity: quantity,
                onIncrement: _increment,
                onDecrement: _decrement,
                onToggleWishlist: () {
                  context.toggleWishlist(widget.productId);
                },
                onAddToCart: () {
                  context.addToCartSafe(widget.productId);
                },
              );
            },

            error: (message) {
              return Center(
                child: Text(
                  message,
                  style: context.textStyle.copyWith(
                    color: context.color.textPrimary,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
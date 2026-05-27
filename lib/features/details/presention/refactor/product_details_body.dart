// features/details/presention/widgets/product_details_body.dart

import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ✅ 1. تم استيراد Entity بدلاً من Model
import 'package:route_smart/core/common/domain/entites/product_entity.dart'; 
import 'package:route_smart/core/extensions/cart_extenions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/extensions/wishlist_extention.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_event.dart';
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
  final ProductEntity initialProduct; 

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  int quantity = 1;

  void _increment() => setState(() => quantity++);

  void _decrement() {
    if (quantity <= 1) return;
    setState(() => quantity--);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReviewsBloc, ReviewsState>(
      listenWhen: (previous, current) =>
          current is ReviewCreated ||
          current is ReviewUpdated ||
          current is ReviewDeleted ||
          current is ReviewActionFailure, 
      listener: (context, state) {
        switch (state) {
          case ReviewCreated():
            CustomToast.showSuccess(context, 'Review added successfully');
          case ReviewUpdated():
            CustomToast.showSuccess(context, 'Review updated successfully');
          case ReviewDeleted():
            CustomToast.showSuccess(context, 'Review deleted successfully');
          case ReviewActionFailure(:final message): 
            CustomToast.showError(context, message);
          default:
            break;
        }
      },
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          return switch (state) {
            ProductDetailsInitial() || ProductDetailsInProgress() =>
              const ProductDetailsLoadingShimmer(),
              
            ProductDetailsSuccess(:final product) => ProductDetailsContent(
                product: product,
                productId: widget.productId,
                quantity: quantity,
                onIncrement: _increment,
                onDecrement: _decrement,
                onToggleWishlist: () =>
                    context.toggleWishlistItem(widget.productId),
                onAddToCart: () => context.read<CartBloc>().add(
                  AddToCartRequested(
                    productId: widget.productId,
                    quantity: quantity,
                  ),
                ),
              ),
              
            ProductDetailsFailure(:final message) => Center(
                child: Text(
                  message,
                  style: context.textStyle.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
              ),
          };
        },
      ),
    );
  }
}
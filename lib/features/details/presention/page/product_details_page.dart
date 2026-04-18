import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/di/di.dart';
import 'package:route_smart/core/extensions/cart_extenions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/wishlist_extention.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';
import 'package:route_smart/features/details/presention/manger/product_details_bloc.dart';
import 'package:route_smart/features/details/presention/manger/product_details_event.dart';
import 'package:route_smart/features/details/presention/manger/product_details_state.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_body.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});

  final ProductDataModel product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProductDetailsBloc>()
        ..add(ProductDetailsEvent.getProductDetails(product.id ?? '')),
      child: Scaffold(
        backgroundColor: context.color.background,
        body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) => state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const SizedBox.shrink(),
            success: (details) => ProductDetailsBody(
              product: details,
              productId: product.id ?? '',
              onAddToCart: () => context.addToCartSafe(product.id ?? ''),
              onToggleWishlist: () => context.toggleWishlist(product.id ?? ''),
            ),
            error: (message) => Center(
              child: Text(
                message,
                style: context.textStyle.copyWith(
                  color: context.color.textPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
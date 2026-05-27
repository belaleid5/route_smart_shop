import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/domain/entites/product_entity.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/cart_extenions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/wishlist_extention.dart';
import 'package:route_smart/core/routes/routes_names.dart';

import 'package:route_smart/core/common/widgets/paginated_list_view.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_event.dart';

import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_event.dart';
import 'package:route_smart/features/home/presention/widgets/flash_deal_card.dart';

class FlashDealLoadedList extends StatelessWidget {
  const FlashDealLoadedList({
    super.key,
    required this.products,
    required this.hasReachedMax,
  });

  final List<ProductEntity> products;
  final bool hasReachedMax;

  void _handleCartToggle(BuildContext context, String productId) {
    
    final isInCart = context.read<CartBloc>().state.isProductInCart(productId);

    if (isInCart) {
   
      context.read<CartBloc>().add(
            RemoveFromCartRequested(productId: productId),
          );
    } else {
      
      context.read<CartBloc>().add(
            AddToCartRequested(
              productId: productId,
              quantity: 1,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedListView(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      hasMore: !hasReachedMax,
      isSmoothListView: true,
      loadMore: () => context.read<ProductsBloc>().add(
            const GetProductsEvent(),
          ),
      itemBuilder: (context, index) {
        final product = products[index];
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: FlashDealCard(
            product: product,
            onTap: () => context.pushNamed(
              AppRoutesNames.productDetails,
              arguments: product,
            ),
            onFavoriteTap: () => context.toggleWishlistItem(product.id),
            onAddToCart: () => _handleCartToggle(context, product.id),
          ).animateBottomToTop(
            duration: Duration(milliseconds: 300 + index * 80),
          ),
        );
      },
    );
  }
}
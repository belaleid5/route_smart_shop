import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';
import 'package:route_smart/core/common/widgets/paginated_list_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/extensions/wishlist_extention.dart';
import 'package:route_smart/core/routes/routes_names.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_event.dart';
import 'package:route_smart/features/cart/presention/manger/cart_state.dart';
import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_event.dart';
import 'package:route_smart/features/home/presention/widgets/flash_deal_card.dart';

class FlashDealLoadedList extends StatelessWidget {
  const FlashDealLoadedList({
    super.key,
    required this.products,
    required this.hasReachedMax,
  });

  final List<ProductDataModel> products;
  final bool hasReachedMax;

  void _handleCartToggle(BuildContext context, String productId) {
    final bloc = context.read<CartBloc>();
    if (bloc.isProductInCart(productId)) {
      bloc.add(CartEvent.removeItem(productId));
    } else {
      bloc.add(CartEvent.addToCart(productId));
    }
  }

  void _navigateToDetails(BuildContext context, ProductDataModel product) {
    context.pushName(
      AppRoutesNames.productDetails,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) => current.maybeWhen(
        addToCartSuccess: (_) => true,
        removeItemSuccess: (_) => true,
        error: (_) => true,
        orElse: () => false,
      ),
      listener: (context, state) => state.maybeWhen(
        addToCartSuccess: (_) => CustomToast.showSuccess(
          context,
          context.translate('product_added_to_cart'),
        ),
        removeItemSuccess: (_) => CustomToast.showSuccess(
          context,
          context.translate('item_removed'),
        ),
        error: (message) => CustomToast.showError(
          context,
          context.translate(message),
        ),
        orElse: () => null,
      ),
      child: PaginatedListView(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        hasMore: !hasReachedMax,
        isLoading: false,
        isSmoothListView: true,
        loadMore: () => context
            .read<ProductsBloc>()
            .add(const ProductsEvent.getProducts()),
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: FlashDealCard(
              product: product,
              onTap: () => _navigateToDetails(context, product),
              onFavoriteTap: () => context.toggleWishlist(product.id ?? ''),
              onAddToCart: () => _handleCartToggle(context, product.id ?? ''),
            ),
          ).animateBottomToTop(
            duration: Duration(milliseconds: 300 + (index * 100)),
          );
        },
      ),
    );
  }
}
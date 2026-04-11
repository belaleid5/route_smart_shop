import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';
import 'package:route_smart/core/common/widgets/paginated_list_view.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/wishlist_extention.dart';
import 'package:route_smart/features/details/presention/widgets/product_details_page.dart';
import 'package:route_smart/features/home/presention/manger/product/product_bloc.dart';
import 'package:route_smart/features/home/presention/manger/product/product_event.dart';
import 'package:route_smart/features/home/presention/widgets/flash_deal_card.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';

class FlashDealLoadedList extends StatelessWidget {
  const FlashDealLoadedList({
    super.key,
    required this.products,
    required this.hasReachedMax,
  });

  final List<ProductDataModel> products;
  final bool hasReachedMax;

  @override
  Widget build(BuildContext context) {
    return PaginatedListView(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      hasMore: !hasReachedMax,
      isLoading: false,
      isSmoothListView: true,
      loadMore: () =>
          context.read<ProductsBloc>().add(const ProductsEvent.getProducts()),
      itemBuilder: (context, index) {
        final product = products[index];
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: FlashDealCard(
            product: product,
            onTap: () => _navigateToDetails(context, product),
            onFavoriteTap: () => context.toggleWishlist(product.id ?? ''),
          ),
        ).animateBottomToTop(
          duration: Duration(milliseconds: 300 + (index * 100)),
        );
      },
    );
  }

  void _navigateToDetails(BuildContext context, ProductDataModel product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<WishlistBloc>(),
          child: ProductDetailsPage(product: product),
        ),
      ),
    );
  }
}

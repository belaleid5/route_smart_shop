import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_bloc.dart';
import 'package:route_smart/features/cart/presention/manger/cart_event.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_event.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_state.dart';
import 'package:route_smart/features/wishlist/presention/widgets/wishlist_animation.dart';
import 'package:route_smart/features/wishlist/presention/widgets/wishlist_empty_view.dart';
import 'package:route_smart/features/wishlist/presention/widgets/wishlist_error.dart'; // ✅ تأكد من هذا الـ import
import 'package:route_smart/features/wishlist/presention/widgets/wishlist_shimmer_loading_list.dart';

class WishlistList extends StatelessWidget {
  const WishlistList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        return switch (state) {
          // Loading states
          WishlistInitial() ||
          WishlistInProgress() =>
            const WishlistLoadingShimmer(),

    
          WishlistSuccess(:final items) ||
          WishlistActionFailure(:final items) when items.isEmpty =>
            const WishlistEmptyView(),

         
          WishlistSuccess(:final items) ||
          WishlistActionFailure(:final items) =>
            WishlistAnimatedListView(
              items: items,
              onAddToCart: (productId) {
                context.read<CartBloc>().add(
                  AddToCartRequested(productId: productId, quantity: 1),
                );
              },
            ),

          // Failure state
          WishlistFailure(:final message) => WishlistErrorView( 
              message: message,
              onRetry: () => context.read<WishlistBloc>().add(
                    const GetWishlistEvent(),
                  ),
            ),
        };
      },
    );
  }
}
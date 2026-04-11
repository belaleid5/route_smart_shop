
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_event.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_state.dart';
import 'package:route_smart/features/wishlist/presention/widgets/wishlist_animation.dart';
import 'package:route_smart/features/wishlist/presention/widgets/wishlist_error.dart';
import 'package:route_smart/features/wishlist/presention/widgets/wishlist_shimmer_loading_list.dart';

import 'wishlist_empty_view.dart';

class WishlistList extends StatefulWidget {
  const WishlistList({super.key});

  @override
  State<WishlistList> createState() => _WishlistListState();
}

class _WishlistListState extends State<WishlistList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        return state.when(
          initial: () => const WishlistLoadingShimmer(),
          loading: () => const WishlistLoadingShimmer(),
          loaded: (items, wishlistIds) {
            if (items.isEmpty) return const WishlistEmptyView();
            return WishlistAnimatedListView(items: items);
          },
          error: (message) => WishlistErrorView(
            message: message,
            onRetry: () => context.read<WishlistBloc>().add(
              const WishlistEvent.getWishlist(),
            ),
          ),
        );
      },
    );
  }
}

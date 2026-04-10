// lib/features/wishlist/presention/widgets/wishlist_list.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_event.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_state.dart';
import 'package:route_smart/features/wishlist/presention/widgets/wishlist_error.dart';
import 'package:route_smart/features/wishlist/presention/widgets/wishlist_shimmer_loading_list.dart';
import 'wishlist_card.dart';

import 'wishlist_empty_view.dart';

class WishlistList extends StatelessWidget {
  const WishlistList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const WishlistLoadingShimmer(),
          loaded: (items) {
            if (items.isEmpty) return const WishlistEmptyView();

            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 20),
              itemBuilder: (_, i) => WishlistCard(
                item: items[i],
                onRemove: () => context.read<WishlistBloc>().add(
                      WishlistEvent.removeFromWishlist(items[i].id),
                    ),
                onAddToCart: () {},
              ),
            );
          },
          error: (message) => WishlistErrorView(
            message: message,
            onRetry: () => context
                .read<WishlistBloc>()
                .add(const WishlistEvent.getWishlist()),
          ),
        );
      },
    );
  }
}
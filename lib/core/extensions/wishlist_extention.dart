import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_event.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_state.dart';

extension WishlistContext on BuildContext {
  void toggleWishlist(String productId) {
    if (productId.isEmpty) return;

    final wishlistBloc = read<WishlistBloc>();
    final isFavorite = wishlistBloc.state.isFavorite(productId);

    if (isFavorite) {
      wishlistBloc.add(WishlistEvent.removeFromWishlist(productId));
      CustomToast.showSuccess(this, 'Removed from Wishlist');
    } else {
      wishlistBloc.add(WishlistEvent.addToWishlist(productId));
      CustomToast.showSuccess(this, 'Added to Wishlist');
    }
  }
}
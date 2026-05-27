import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_event.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_state.dart';

extension WishlistContext on BuildContext {
  void toggleWishlistItem(String productId) {
    if (productId.isEmpty) return;

    final wishlistBloc = read<WishlistBloc>();
    final isFavorite = wishlistBloc.state.isFavorite(productId);

    if (isFavorite) {
      wishlistBloc.add(RemoveFromWishlistEvent(productId));
      CustomToast.showSuccess(this, translate(LangKeys.itemRemoved));
    } else {
      wishlistBloc.add(AddToWishlistEvent(productId));
      CustomToast.showSuccess(this, translate(LangKeys.addedToWishlist));
    }
  }
}

// lib/features/wishlist/presention/manger/wishlist_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/features/wishlist/data/model/wishlist_response_model.dart';
import 'package:collection/collection.dart';

part 'wishlist_state.freezed.dart';

@freezed
class WishlistState with _$WishlistState {
  const factory WishlistState.initial() = InitialState;
  const factory WishlistState.loading() = LoadingState;
  @Assert('wishlistIds != null')
  const factory WishlistState.loaded({
    required List<WishlistItemModel> items,
    required Set<String> wishlistIds,
  }) = LoadedState;
  
  const factory WishlistState.error(String message) = ErrorState;
}

extension WishlistStateX on WishlistState {
  Set<String> get wishlistIds => maybeWhen(
        loaded: (items, ids) => ids,
        orElse: () => <String>{},
      );

  bool isFavorite(String productId) {
    return wishlistIds.contains(productId);
  }
  
  int get wishlistHash => const SetEquality().hash(wishlistIds);
}
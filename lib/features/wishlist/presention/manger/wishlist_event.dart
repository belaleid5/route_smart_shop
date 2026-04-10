// features/wishlist/presentation/bloc/wishlist_event.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_event.freezed.dart'; 

@freezed
class WishlistEvent with _$WishlistEvent {
  const factory WishlistEvent.getWishlist() = GetWishlistEvent;
  const factory WishlistEvent.addToWishlist(String productId) = AddToWishlistEvent;
  const factory WishlistEvent.removeFromWishlist(String productId) = RemoveFromWishlistEvent;
}
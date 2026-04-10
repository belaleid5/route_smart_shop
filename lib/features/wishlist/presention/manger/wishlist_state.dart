import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/features/wishlist/data/model/wishlist_response_model.dart';

part 'wishlist_state.freezed.dart';

// wishlist_state.dart
@freezed
class WishlistState with _$WishlistState {
  const factory WishlistState.initial() = InitialState;
  const factory WishlistState.loading() = LoadingState;
  const factory WishlistState.loaded(List<WishlistItemModel> items) = LoadedState; 
  const factory WishlistState.error(String error) = ErrorState;
}

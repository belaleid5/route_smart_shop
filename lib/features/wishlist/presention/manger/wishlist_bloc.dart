// features/wishlist/presentation/bloc/wishlist_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/wishlist/data/repo/wishlisrt_repo.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_event.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final WishlistRepository repository;

  WishlistBloc(this.repository) : super(const WishlistState.initial()) {
    on<GetWishlistEvent>(onGetWishlist);
    on<AddToWishlistEvent>(onAddToWishlist);
    on<RemoveFromWishlistEvent>(onRemoveFromWishlist);
  }

  Future<void> onGetWishlist(
    GetWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(const WishlistState.loading());

    final result = await repository.getWishlist();

    result.when(
      success: (data) => emit(WishlistState.loaded(data)),
      failure: (error) => emit(WishlistState.error(error)),
    );
  }

  Future<void> onAddToWishlist(
    AddToWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(const WishlistState.loading());

    final result = await repository.addToWishlist(event.productId);

    result.when(
      success: (data) => add(const WishlistEvent.getWishlist()),
      failure: (error) => emit(WishlistState.error(error)),
    );
  }

  Future<void> onRemoveFromWishlist(
    RemoveFromWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(const WishlistState.loading());

    final result = await repository.removeFromWishlist(event.productId);

    result.when(
      success: (data) => add(const WishlistEvent.getWishlist()),
      failure: (error) => emit(WishlistState.error(error)),
    );
  }
}

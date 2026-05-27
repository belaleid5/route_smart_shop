import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/wishlist/domain/usecase/add_to_wishlist_use_case.dart';
import 'package:route_smart/features/wishlist/domain/usecase/get_wishlist_use_case.dart';
import 'package:route_smart/features/wishlist/domain/usecase/remove_from_wishlist_use_case.dart';
import 'wishlist_event.dart';
import 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc({
    required GetWishlistUseCase getWishlistUseCase,
    required AddToWishlistUseCase addToWishlistUseCase,
    required RemoveFromWishlistUseCase removeFromWishlistUseCase,
  })  : _getWishlistUseCase = getWishlistUseCase,
        _addToWishlistUseCase = addToWishlistUseCase,
        _removeFromWishlistUseCase = removeFromWishlistUseCase,
        super(const WishlistInitial()) {
    on<GetWishlistEvent>(_onGetWishlist, transformer: restartable());
    
    on<AddToWishlistEvent>(_onAddToWishlist, transformer: droppable());
    on<RemoveFromWishlistEvent>(_onRemoveFromWishlist, transformer: droppable());
  }

  final GetWishlistUseCase _getWishlistUseCase;
  final AddToWishlistUseCase _addToWishlistUseCase;
  final RemoveFromWishlistUseCase _removeFromWishlistUseCase;


  Future<void> _onGetWishlist(
    GetWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    if (state is WishlistInProgress) return;

    final current = state;

    if (current is WishlistSuccess) {
      emit(current.copyWith(isLoading: true));
    } else {
      emit(const WishlistInProgress());
    }

    final result = await _getWishlistUseCase();

    switch (result) {
      case Success(:final data):
        final ids = data
            .where((e) => e.id.isNotEmpty)
            .map((e) => e.id)
            .toSet();
        emit(WishlistSuccess(items: data, wishlistIds: ids));

      case Failure(:final message):
        if (kDebugMode) debugPrint('❌ WishlistBloc._onGetWishlist: $message');
        emit(WishlistFailure(message));
    }
  }


 Future<void> _onAddToWishlist(
  AddToWishlistEvent event,
  Emitter<WishlistState> emit,
) async {
  final productId = event.productId;

  final current = state is WishlistSuccess
      ? state as WishlistSuccess
      : const WishlistSuccess(items: [], wishlistIds: {});

  if (current.wishlistIds.contains(productId)) return;

  final optimisticIds = Set<String>.from(current.wishlistIds)..add(productId);
  emit(current.copyWith(wishlistIds: optimisticIds));

  final result = await _addToWishlistUseCase(productId);

  switch (result) {
    case Success():
      add(const GetWishlistEvent());
      break;

    case Failure(:final message):
      final rollbackIds = Set<String>.from(current.wishlistIds);
      emit(WishlistActionFailure(
        message: message,
        items: current.items,
        wishlistIds: rollbackIds,
      ));
  }
}



  Future<void> _onRemoveFromWishlist(
    RemoveFromWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    final current = state;
    if (current is! WishlistSuccess) return;

    final productId = event.productId;
    if (!current.wishlistIds.contains(productId)) return;

    final optimisticItems =
        current.items.where((item) => item.id != productId).toList();
    final optimisticIds = Set<String>.from(current.wishlistIds)
      ..remove(productId);
    emit(current.copyWith(
      items: optimisticItems,
      wishlistIds: optimisticIds,
    ));

    final result = await _removeFromWishlistUseCase(productId);

    switch (result) {
      case Success():
        break;

      case Failure(:final message):
        if (kDebugMode) {
          debugPrint('❌ WishlistBloc._onRemoveFromWishlist: $message');
        }
   
        emit(WishlistActionFailure(
          message: message,
          items: current.items,
          wishlistIds: current.wishlistIds,
        ));
    }
  }
}
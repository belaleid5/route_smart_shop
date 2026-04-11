import 'package:bloc/bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/wishlist/data/repo/wishlisrt_repo.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_event.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final WishlistRepository repository;

  WishlistBloc(this.repository) : super(const WishlistState.initial()) {
    on<GetWishlistEvent>(_onGetWishlist);
    on<AddToWishlistEvent>(_onAddToWishlist);
    on<RemoveFromWishlistEvent>(_onRemoveFromWishlist);
  }

  Future<void> _onGetWishlist(
    GetWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    if (state is InitialState) {
      emit(const WishlistState.loading());
    }

    final result = await repository.getWishlist();

    result.when(
      success: (items) {
        final ids = items.map((e) => e.id).toSet();
        emit(WishlistState.loaded(items: items, wishlistIds: ids));
      },
      failure: (error) => emit(WishlistState.error(error)),
    );
  }

  Future<void> _onAddToWishlist(
    AddToWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    final current = state;
    final productId = event.productId;

    if (current is! LoadedState) {
      await _onGetWishlist(const GetWishlistEvent(), emit);
      final newState = state;
      if (newState is LoadedState && !newState.wishlistIds.contains(productId)) {
        add(WishlistEvent.addToWishlist(productId));
      }
      return;
    }



    final updatedIds = Set<String>.from(current.wishlistIds)..add(productId);
    emit(WishlistState.loaded(
      items: current.items,
      wishlistIds: updatedIds,
    ));

    final result = await repository.addToWishlist(productId);

    result.when(
      success: (_) {
        add(const GetWishlistEvent());
      },
      failure: (error) {
   
        emit(WishlistState.loaded(
          items: current.items,
          wishlistIds: current.wishlistIds,
        ));
        emit(WishlistState.error(error));
      },
    );
  }

  Future<void> _onRemoveFromWishlist(
    RemoveFromWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    final currentState = state;
    if (currentState is! LoadedState) return;

    final previousItems = currentState.items;
    final previousIds = currentState.wishlistIds;
    final productId = event.productId;

    if (!previousIds.contains(productId)) {
      return;
    }



    final updatedItems =
        previousItems.where((item) => item.id != productId).toList();
    final updatedIds = Set<String>.from(previousIds)..remove(productId);

    emit(WishlistState.loaded(
      items: updatedItems,
      wishlistIds: updatedIds,
    ));

    final result = await repository.removeFromWishlist(productId);

    result.when(
      success: (_) {
      },
      failure: (error) {
 
        emit(WishlistState.loaded(
          items: previousItems,
          wishlistIds: previousIds,
        ));
        emit(WishlistState.error(error));
      },
    );
  }
}


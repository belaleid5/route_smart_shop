import 'package:route_smart/features/wishlist/domain/entites/wishlist_entity.dart';

sealed class WishlistState {
  const WishlistState();
}

final class WishlistInitial extends WishlistState {
  const WishlistInitial();
}

final class WishlistInProgress extends WishlistState {
  const WishlistInProgress();
}

final class WishlistSuccess extends WishlistState {
  const WishlistSuccess({
    required this.items,
    required this.wishlistIds,
    this.isLoading = false,
  });

  final List<WishlistEntity> items;
  final Set<String> wishlistIds;
  final bool isLoading;

  bool isFavorite(String productId) => wishlistIds.contains(productId);

  WishlistSuccess copyWith({
    List<WishlistEntity>? items,
    Set<String>? wishlistIds,
    bool? isLoading,
  }) {
    return WishlistSuccess(
      items: items ?? this.items,
      wishlistIds: wishlistIds ?? this.wishlistIds,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final class WishlistActionFailure extends WishlistState {
  const WishlistActionFailure({
    required this.message,
    required this.items,
    required this.wishlistIds,
  });

  final String message;
  final List<WishlistEntity> items;
  final Set<String> wishlistIds;
}

final class WishlistFailure extends WishlistState {
  const WishlistFailure(this.message);
  final String message;
}

extension WishlistStateX on WishlistState {
  Set<String> get wishlistIds => switch (this) {
        WishlistSuccess(:final wishlistIds) => wishlistIds,
        WishlistActionFailure(:final wishlistIds) => wishlistIds,
        _ => {},
      };

  bool isFavorite(String productId) => wishlistIds.contains(productId);
}
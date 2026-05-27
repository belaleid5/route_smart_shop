sealed class WishlistEvent {
  const WishlistEvent();
}

final class GetWishlistEvent extends WishlistEvent {
  const GetWishlistEvent();
}

final class AddToWishlistEvent extends WishlistEvent {
  final String productId;
  const AddToWishlistEvent(this.productId);
}

final class RemoveFromWishlistEvent extends WishlistEvent {
  final String productId;
  const RemoveFromWishlistEvent(this.productId);
}

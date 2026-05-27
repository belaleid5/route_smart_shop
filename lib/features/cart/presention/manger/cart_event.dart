sealed class CartEvent {
  const CartEvent();
}

final class AddToCartRequested extends CartEvent {
  const AddToCartRequested({
    required this.productId,
    this.quantity = 1, 
  });

  final String productId;
  final int quantity;
}

final class RemoveFromCartRequested extends CartEvent {
  const RemoveFromCartRequested({required this.productId});
  final String productId;
}

final class UpdateQuantityRequested extends CartEvent {
  const UpdateQuantityRequested({
    required this.productId,
    required this.quantity,
  });

  final String productId;
  final int quantity;
}

final class GetCartRequested extends CartEvent {
  const GetCartRequested();
}

final class ClearCartRequested extends CartEvent {
  const ClearCartRequested();
}
final class CartItemEntity {
  const CartItemEntity({
    required this.cartItemId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
    this.imageUrl,
  });

  final String cartItemId;
  final String productId;
  final String productName;
  final int quantity;
  final double price;
  final String? imageUrl;
}
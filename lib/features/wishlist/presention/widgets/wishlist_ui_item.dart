// lib/features/wishlist/presentation/widgets/wishlist_ui_item.dart

class WishlistUiItem {
  final String image;
  final String title;
  final double price;
  final double? oldPrice;

  const WishlistUiItem({
    required this.image,
    required this.title,
    required this.price,
    this.oldPrice,
  });
}

class WishlistRequestModel {
  final String productId;

  const WishlistRequestModel({
    required this.productId,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
    };
  }
}
// features/details/presentation/manager/product_details_event.dart

sealed class ProductDetailsEvent {
  const ProductDetailsEvent();
}

final class ProductDetailsRequested extends ProductDetailsEvent {
  final String productId;

  const ProductDetailsRequested(this.productId);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDetailsRequested &&
          runtimeType == other.runtimeType &&
          productId == other.productId;

  @override
  int get hashCode => productId.hashCode;
}
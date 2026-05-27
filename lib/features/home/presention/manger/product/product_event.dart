sealed class ProductsEvent {
  const ProductsEvent();
}

final class GetProductsEvent extends ProductsEvent {
  const GetProductsEvent();
}

final class RefreshProductsEvent extends ProductsEvent {
  const RefreshProductsEvent();
}
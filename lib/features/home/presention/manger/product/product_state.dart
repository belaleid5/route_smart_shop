import 'package:route_smart/core/common/domain/entites/product_entity.dart';

sealed class ProductsState {
  const ProductsState();
}

final class ProductsInitial extends ProductsState {
  const ProductsInitial();
}

final class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

final class ProductsSuccess extends ProductsState {
  const ProductsSuccess({
    this.products = const [],
    this.hasReachedMax = false,
  });

  final List<ProductEntity> products;
  final bool hasReachedMax;

  ProductsSuccess copyWith({
    List<ProductEntity>? products,
    bool? hasReachedMax,
  }) {
    return ProductsSuccess(
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }


}

final class ProductsError extends ProductsState {
  const ProductsError(this.message);
  final String message;

 
}


import 'package:route_smart/features/details/domain/entites/product_details_entit.dart';

sealed class ProductDetailsState {
  const ProductDetailsState();
}

final class ProductDetailsInitial extends ProductDetailsState {
  const ProductDetailsInitial();
}

final class ProductDetailsInProgress extends ProductDetailsState {
  const ProductDetailsInProgress();
}

final class ProductDetailsSuccess extends ProductDetailsState {
  final ProductDetailsEntity product;

  const ProductDetailsSuccess(this.product);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDetailsSuccess &&
          runtimeType == other.runtimeType &&
          product == other.product;

  @override
  int get hashCode => product.hashCode;
}

final class ProductDetailsFailure extends ProductDetailsState {
  final String message;

  const ProductDetailsFailure(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDetailsFailure &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}
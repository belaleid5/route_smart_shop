import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_event.freezed.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.getProducts() = GetProductsEvent;
  const factory ProductsEvent.refreshProducts() = RefreshProductsEvent;
}
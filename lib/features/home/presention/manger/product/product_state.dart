import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';

part 'product_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.loading() = _Loading;

  const factory ProductsState.success({
    @Default([]) List<ProductDataModel> products,
    @Default(false) bool hasReachedMax,
  }) = _Success;

  const factory ProductsState.error(String message) = _Error;
}

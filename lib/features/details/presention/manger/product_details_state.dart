import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/features/details/data/models/product_details_response_model.dart';
part 'product_details_state.freezed.dart';


@freezed
sealed class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.initial() = ProductDetailsInitial;
  const factory ProductDetailsState.loading() = ProductDetailsLoading;
  const factory ProductDetailsState.success(ProductDetailsDataModel product) =
      ProductDetailsSuccess;
  const factory ProductDetailsState.error(String message) = ProductDetailsError;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/features/home/data/models/brand_response_model.dart';
import 'package:route_smart/features/home/data/models/category_response_model.dart';

part 'brands_state.freezed.dart';

@freezed
class BrandsState with _$BrandsState {
  const factory BrandsState.initial() = _Initial;
  const factory BrandsState.loading() = _Loading; 
  const factory BrandsState.success({
    @Default([]) List<BrandData> brands,
    @Default(false) bool hasReachedMax,
  }) = _Success;
  const factory BrandsState.error(String message) = _Error;
}                     
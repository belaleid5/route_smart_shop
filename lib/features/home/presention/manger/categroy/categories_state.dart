import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.loading() = _Loading; // لودينج أول صفحة
  const factory CategoriesState.success({
    @Default([]) List<CategoryData> categories,
    @Default(false) bool hasReachedMax,
  }) = _Success;
  const factory CategoriesState.error(String message) = _Error;
}                     
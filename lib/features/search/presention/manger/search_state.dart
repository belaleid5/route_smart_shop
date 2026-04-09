import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/core/common/data/model/brand_response_model.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';
part 'search_state.freezed.dart';

@freezed
sealed class SearchState with _$SearchState {
  const factory SearchState.initial() = SearchInitial;

  const factory SearchState.loading() = SearchLoading;

  const factory SearchState.success({
    required SearchFilterParams params,
    required List<ProductDataModel> products,

    @Default([]) List<CategoryData> categories,
    @Default([]) List<BrandData> brands,

    @Default(0) int totalProducts,
    @Default(0) int totalBrands,
    @Default(0) int totalCategories,

    @Default(false) bool isLoadingMore,
    @Default(false) bool hasReachedMax,
  }) = SearchSuccess;

  const factory SearchState.error(String message) = SearchError;
}
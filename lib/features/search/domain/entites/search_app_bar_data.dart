import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/features/search/domain/entites/search_params.dart';

class SearchAppBarData {
  const SearchAppBarData({
    required this.categories,
    required this.selectedCategoryId,
    required this.params,
  });

  final List<CategoryData> categories;
  final String? selectedCategoryId;
  final SearchFilterParams params;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchAppBarData &&
          categories == other.categories &&
          selectedCategoryId == other.selectedCategoryId &&
          params == other.params;

  @override
  int get hashCode =>
      categories.hashCode ^ selectedCategoryId.hashCode ^ params.hashCode;
}

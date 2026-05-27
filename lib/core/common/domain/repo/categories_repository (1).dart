import 'package:route_smart/core/common/domain/entites/categories_page_entity.dart';
import 'package:route_smart/core/services/api/api_result.dart';

abstract interface class CategoriesRepository {
  Future<ApiResult<CategoriesPageEntity>> getCategories({
    required int page,
    int? limit,
    String? keyword,
  });
}

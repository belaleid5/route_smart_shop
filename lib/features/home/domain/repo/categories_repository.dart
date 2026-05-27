import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/core/services/api/api_result.dart';

abstract class CategoriesRepository {
  Future<ApiResult<List<CategoryEntity>>> getCategories({
    required int page,
    required int limit,
  });
}

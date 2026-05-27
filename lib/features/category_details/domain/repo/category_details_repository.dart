// lib/features/category_details/domain/repositories/category_details_repository.dart

import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/category_details/domain/entites/subcategory_entity.dart';

abstract interface class CategoryDetailsRepository {
  Future<ApiResult<List<SubcategoryEntity>>> getSubcategories(
    String categoryId,
  );
}
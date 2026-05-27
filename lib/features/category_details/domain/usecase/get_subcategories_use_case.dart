import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/category_details/domain/entites/subcategory_entity.dart';
import 'package:route_smart/features/category_details/domain/repo/category_details_repository.dart';

final class GetSubcategoriesUseCase {
  const GetSubcategoriesUseCase(this._repository);

  final CategoryDetailsRepository _repository;

  Future<ApiResult<List<SubcategoryEntity>>> call(String categoryId) {
    return _repository.getSubcategories(categoryId);
  }
}

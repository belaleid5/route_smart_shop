import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/core/usecase/usecase.dart';
import 'package:route_smart/features/home/domain/repo/categories_repository.dart';

class GetCategoriesParams {
  final int page;
  final int limit;

  const GetCategoriesParams({required this.page, required this.limit});
}

class GetCategoriesUseCase
    implements UseCase<ApiResult<List<CategoryEntity>>, GetCategoriesParams> {
  final CategoriesRepository _repository;

  const GetCategoriesUseCase(this._repository);

  @override
  Future<ApiResult<List<CategoryEntity>>> call(
      GetCategoriesParams params) async {
    return await _repository.getCategories(
      page: params.page,
      limit: params.limit,
    );
  }
}

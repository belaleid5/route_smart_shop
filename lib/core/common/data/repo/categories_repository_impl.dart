import 'package:route_smart/core/common/data/data_source/all_products_data_source.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/core/errors/api_error_handler.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/home/domain/repo/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  const CategoriesRepositoryImpl(this._remoteDataSource);

  final AllDataProductsRemoteDataSource _remoteDataSource;

@override
Future<ApiResult<List<CategoryEntity>>> getCategories({
  required int page,
  required int limit,
}) async {
  try {
    final response = await _remoteDataSource.getCategories(
      page: page,
      limit: limit,
    );

    // ✅ أضف دول
    print('📦 results: ${response.results}');
    print('📦 data length: ${response.data?.length}');
    print('📦 data: ${response.data}');

    return Success(
      response.data?.map((e) => e.toEntity()).toList() ?? <CategoryEntity>[],
    );
  } catch (error) {
    print('❌ error: $error');
    final failure = ErrorHandler.handle(error);
    return Failure(
      failure.apiErrorModel.message ?? 'Failed to load categories',
    );
  }
}
}

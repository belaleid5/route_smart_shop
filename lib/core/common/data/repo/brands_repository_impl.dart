import 'package:route_smart/core/common/data/data_source/all_products_data_source.dart';
import 'package:route_smart/core/common/domain/entites/brand_entity.dart';
import 'package:route_smart/core/errors/api_error_handler.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/home/domain/repo/brands_repository.dart';

class BrandsRepositoryImpl implements BrandsRepository {
  const BrandsRepositoryImpl(this._remoteDataSource);

  final AllDataProductsRemoteDataSource _remoteDataSource;

  @override
  Future<ApiResult<List<BrandEntity>>> getBrands({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _remoteDataSource.getBrands(
        page: page,
        limit: limit,
      );

      return Success(
        response.data?.map((e) => e.toEntity()).toList() ?? <BrandEntity>[],
      );
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Failure(
        failure.apiErrorModel.message ?? 'Failed to load brands',
      );
    }
  }
}

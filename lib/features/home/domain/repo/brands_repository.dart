import 'package:route_smart/core/common/domain/entites/brand_entity.dart';
import 'package:route_smart/core/services/api/api_result.dart';

abstract class BrandsRepository {
  Future<ApiResult<List<BrandEntity>>> getBrands({
    required int page,
    required int limit,
  });
}

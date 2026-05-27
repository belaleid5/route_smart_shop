import 'package:route_smart/core/common/domain/entites/brands_page_entity.dart';
import 'package:route_smart/core/services/api/api_result.dart';

abstract interface class BrandsRepository {
  Future<ApiResult<BrandsPageEntity>> getBrands({
    required int page,
    int? limit,
    String? keyword,
  });
}

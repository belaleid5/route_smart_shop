import 'package:route_smart/core/common/domain/entites/product_entity.dart';
import 'package:route_smart/core/services/api/api_result.dart';

abstract class ProductsRepository {
  Future<ApiResult<List<ProductEntity>>> getProducts({required int page});
}

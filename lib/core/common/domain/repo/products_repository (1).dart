import 'package:route_smart/core/common/domain/entites/product_filter_params.dart';
import 'package:route_smart/core/common/domain/entites/products_page_entity.dart';
import 'package:route_smart/core/services/api/api_result.dart';

abstract interface class ProductsRepository {
  Future<ApiResult<ProductsPageEntity>> getProducts(
    ProductFilterParams params,
  );
}

// features/details/domain/repo/product_details_repo.dart

import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/details/domain/entites/product_details_entit.dart';

abstract class ProductDetailsRepository {
  Future<ApiResult<ProductDetailsEntity>> getProductDetails(String productId);
}
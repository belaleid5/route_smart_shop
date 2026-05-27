// features/details/domain/use_cases/get_product_details_use_case.dart

import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/details/domain/entites/product_details_entit.dart';
import 'package:route_smart/features/details/domain/repo/product_details_repo.dart';

class GetProductDetailsUseCase {
  final ProductDetailsRepository _repository;

  GetProductDetailsUseCase(this._repository);

  Future<ApiResult<ProductDetailsEntity>> call(String productId) {
    return _repository.getProductDetails(productId);
  }
}
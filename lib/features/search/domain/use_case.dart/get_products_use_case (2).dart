import 'package:route_smart/core/common/domain/entites/product_entity.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/core/usecase/usecase.dart';
import 'package:route_smart/features/home/domain/repo/products_repository.dart';

class GetProductsParams {
  final int page;

  const GetProductsParams({required this.page});
}

class GetProductsUseCase
    implements UseCase<ApiResult<List<ProductEntity>>, GetProductsParams> {
  final ProductsRepository _repository;

  const GetProductsUseCase(this._repository);

  @override
  Future<ApiResult<List<ProductEntity>>> call(GetProductsParams params) async {
    return await _repository.getProducts(page: params.page);
  }
}

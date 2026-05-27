// features/details/data/repo/product_details_repo_impl.dart

import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/details/data/data_source/product_details_data_source.dart';
import 'package:route_smart/features/details/domain/entites/product_details_entit.dart';
import 'package:route_smart/features/details/domain/repo/product_details_repo.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ProductDetailsRemoteDataSource dataSource;

  ProductDetailsRepositoryImpl(this.dataSource);

  @override
  Future<ApiResult<ProductDetailsEntity>> getProductDetails(String productId) async {
    try {
      final response = await dataSource.getProductDetails(productId);
      
      if (response.data == null) {
        return ApiResult.failure('Product not found');
      }

    
      return ApiResult.success(response.data!.toEntity());
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
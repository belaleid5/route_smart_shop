import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/details/data/data_source/product_details_data_source.dart';
import 'package:route_smart/features/details/data/models/product_details_response_model.dart';

class ProductDetailsRepository {
  final ProductDetailsRemoteDataSource dataSource;

  ProductDetailsRepository(this.dataSource);

  Future<ApiResult<ProductDetailsResponseModel>> getProductDetails(
    String productId,
  ) async {
    try {
      final response = await dataSource.getProductDetails(productId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
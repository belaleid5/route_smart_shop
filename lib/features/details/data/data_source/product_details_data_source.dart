import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/features/details/data/models/product_details_response_model.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ProductDetailsResponseModel> getProductDetails(String productId);
}

class ProductDetailsRemoteDataSourceImpl
    implements ProductDetailsRemoteDataSource {
  final ApiService apiService;

  ProductDetailsRemoteDataSourceImpl(this.apiService);

  @override
  Future<ProductDetailsResponseModel> getProductDetails(
    String productId,
  ) async {
    return apiService.getProductDetails(productId);
  }
}
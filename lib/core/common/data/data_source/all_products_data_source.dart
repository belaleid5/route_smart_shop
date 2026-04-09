import 'package:route_smart/core/common/data/model/brand_response_model.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/common/data/model/product_response_model.dart';
import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';

abstract class AllDataProductsRemoteDataSource {
  Future<CategoryResponseModel> getCategories(int page, String? keyword);
  Future<BrandResponseModel> getBrands(int page, String? keyword);
  Future<ProductResponseModel> getProduct(SearchFilterParams params);
}

class AllDataProductsRemoteDataSourceImpl
    implements AllDataProductsRemoteDataSource {
  final ApiService _apiService;
  AllDataProductsRemoteDataSourceImpl(this._apiService);

  @override
  Future<CategoryResponseModel> getCategories(
    int page,
    String? keyword,
  ) async {
    return _apiService.getCategories(page, 10, keyword);
  }

  @override
  Future<BrandResponseModel> getBrands(
    int page,
    String? keyword,
  ) async {
    return _apiService.getBrands(page, 5, keyword);
  }

  @override
Future<ProductResponseModel> getProduct(SearchFilterParams params) async {
  return _apiService.getProducts(
    params.page,
    params.limit,
    params.sort,
    null,              
    params.categoryId,
    params.brandId,
    null,             
    params.minPrice,   
    params.maxPrice,   
  );
}
}
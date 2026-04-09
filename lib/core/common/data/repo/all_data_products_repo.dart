import 'package:route_smart/core/common/data/data_source/all_products_data_source.dart';
import 'package:route_smart/core/common/data/model/brand_response_model.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/common/data/model/product_response_model.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';

class AllDataProductsRepository {
  final AllDataProductsRemoteDataSource _homeRemoteDataSource;
  AllDataProductsRepository(this._homeRemoteDataSource);

  Future<ApiResult<CategoryResponseModel>> getCategories(
    int page,
    String? keyword,
  ) async {
    try {
      final response = await _homeRemoteDataSource.getCategories(page, keyword);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<BrandResponseModel>> getBrands(
    int page,
    String? keyword,
  ) async {
    try {
      final response = await _homeRemoteDataSource.getBrands(page, keyword);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<ProductResponseModel>> getProduct(
    SearchFilterParams params,
  ) async {
    try {
      final response = await _homeRemoteDataSource.getProduct(params);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
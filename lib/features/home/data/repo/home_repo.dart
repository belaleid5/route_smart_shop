

import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/home/data/data_source/home_data_source.dart';
import 'package:route_smart/features/home/data/models/brand_response_model.dart';
import 'package:route_smart/features/home/data/models/category_response_model.dart';
import 'package:route_smart/features/home/data/models/product_response_model.dart';

class  HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  HomeRepository(this._homeRemoteDataSource);

  Future<ApiResult<CategoryResponseModel>> getCategories(int page) async {
    try {
      final response = await _homeRemoteDataSource.getCategories(page);
      
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }



  Future<ApiResult<BrandResponseModel>> getBrands(int page) async {
    try {
      final response = await _homeRemoteDataSource.getBrands(page);
      
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }





 Future<ApiResult<ProductResponseModel>> getProduct(int page,) async {
  try {
    final response = await _homeRemoteDataSource.getProduct(page, );
    
    return ApiResult.success(response);
  } catch (error) {
    return ApiResult.failure(error.toString());
  }
}
}
import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/features/home/data/models/brand_response_model.dart';
import 'package:route_smart/features/home/data/models/category_response_model.dart';
import 'package:route_smart/features/home/data/models/product_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<CategoryResponseModel> getCategories(int page);
  Future<BrandResponseModel> getBrands(int page);
   Future<ProductResponseModel> getProduct(int page,) ;
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<CategoryResponseModel> getCategories(int page) async {
    return await _apiService.getCategories(page, 10);
  }


 @override
  Future<BrandResponseModel> getBrands(int page) async {
    return await _apiService.getBrands(page, 5);
  }
  
  @override
 // داخل الـ RemoteDataSource
Future<ProductResponseModel> getProduct(int page, ) async {
  return await _apiService.getProducts(page, 10, ); 
}


 
}

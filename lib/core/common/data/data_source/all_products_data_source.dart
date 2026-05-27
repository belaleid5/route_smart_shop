import 'package:route_smart/core/common/data/model/brand_response_model.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/common/data/model/product_response_model.dart';
import 'package:route_smart/core/common/domain/entites/product_filter_params.dart';
import 'package:route_smart/core/services/api/api_services.dart';

abstract interface class AllDataProductsRemoteDataSource {
  Future<CategoryResponseModel> getCategories({
    required int page,
    int? limit,
    String? keyword,
  });

  Future<BrandResponseModel> getBrands({
    required int page,
    int? limit,
    String? keyword,
  });

  Future<ProductResponseModel> getProducts(ProductFilterParams params);
}

class AllDataProductsRemoteDataSourceImpl
    implements AllDataProductsRemoteDataSource {
  const AllDataProductsRemoteDataSourceImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<CategoryResponseModel> getCategories({
    required int page,
    int? limit,
    String? keyword,
  }) =>
      _apiService.getCategories(
        page: page,
        limit: limit,
        keyword: keyword,
      );

  @override
  Future<BrandResponseModel> getBrands({
    required int page,
    int? limit,
    String? keyword,
  }) =>
      _apiService.getBrands(
        page: page,
        limit: limit,
        keyword: keyword,
      );

  @override
  Future<ProductResponseModel> getProducts(ProductFilterParams params) =>
      _apiService.getProducts(
        page: params.page,
        limit: params.limit,
        sort: params.sort,
        keyword: params.keyword.isEmpty ? null : params.keyword,
        category: params.categoryId,
        brand: params.brandId,
        subcategory: null,
        priceGte: params.minPrice,
        priceLte: params.maxPrice,
      );
}
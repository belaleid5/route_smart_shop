import 'package:route_smart/core/common/domain/entites/brands_page_entity.dart';
import 'package:route_smart/core/common/domain/entites/categories_page_entity.dart';
import 'package:route_smart/core/common/domain/entites/products_page_entity.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/search/domain/entites/search_params.dart';


abstract interface class SearchCatalogRepository {
  Future<ApiResult<ProductsPageEntity>> getProducts(SearchFilterParams params);

  Future<ApiResult<BrandsPageEntity>> getBrands({
    required SearchFilterParams params,
  });

  Future<ApiResult<CategoriesPageEntity>> getCategories({
    required SearchFilterParams params,
  });
}
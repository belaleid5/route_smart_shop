import 'package:route_smart/core/common/data/data_source/all_products_data_source.dart';
import 'package:route_smart/core/common/domain/entites/brands_page_entity.dart';
import 'package:route_smart/core/common/domain/entites/categories_page_entity.dart';
import 'package:route_smart/core/common/domain/entites/products_page_entity.dart';
import 'package:route_smart/core/errors/api_error_handler.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/search/domain/entites/search_params.dart';
import 'package:route_smart/features/search/domain/repo/search_category_repo.dart';

class SearchCatalogRepositoryImpl implements SearchCatalogRepository {
  const SearchCatalogRepositoryImpl(this.remoteDataSource);

  final AllDataProductsRemoteDataSource remoteDataSource;

  @override
  Future<ApiResult<ProductsPageEntity>> getProducts(
      SearchFilterParams params) async {
    try {
      final response =
          await remoteDataSource.getProducts(params.toFilterParams());
      return Success(
        ProductsPageEntity(
          products:
              (response.data ?? []).map((model) => model.toEntity()).toList(),
          metadata: response.metadata!,
        ),
      );
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Failure(
          failure.apiErrorModel.message ?? 'Failed to load products');
    }
  }

  @override
  Future<ApiResult<BrandsPageEntity>> getBrands({
    required SearchFilterParams params,
  }) async {
    try {
      final response = await remoteDataSource.getBrands(
        page: params.page,
        limit: params.limit,
        keyword: params.keyword.isEmpty ? null : params.keyword,
      );
      return Success(
        BrandsPageEntity(
          brands:
              (response.data ?? []).map((model) => model.toEntity()).toList(),
          metadata: response.metadata!,
        ),
      );
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Failure(failure.apiErrorModel.message ?? 'Failed to load brands');
    }
  }

  @override
  Future<ApiResult<CategoriesPageEntity>> getCategories({
    required SearchFilterParams params,
  }) async {
    try {
      final response = await remoteDataSource.getCategories(
        page: params.page,
        limit: params.limit,
        keyword: params.keyword.isEmpty ? null : params.keyword,
      );
      return Success(
        CategoriesPageEntity(
          categories:
              (response.data ?? []).map((model) => model.toEntity()).toList(),
          metadata: response.metadata!,
        ),
      );
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Failure(
          failure.apiErrorModel.message ?? 'Failed to load categories');
    }
  }
}

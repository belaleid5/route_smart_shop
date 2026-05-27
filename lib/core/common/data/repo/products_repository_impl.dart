import 'package:route_smart/core/common/data/data_source/all_products_data_source.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';
import 'package:route_smart/core/common/domain/entites/brand_entity.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/core/common/domain/entites/product_entity.dart';
import 'package:route_smart/core/common/domain/entites/product_filter_params.dart';
import 'package:route_smart/core/errors/api_error_handler.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/home/domain/repo/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  const ProductsRepositoryImpl(this._remoteDataSource);

  final AllDataProductsRemoteDataSource _remoteDataSource;

  @override
  Future<ApiResult<List<ProductEntity>>> getProducts({
    required int page,
  }) async {
    try {
      final response = await _remoteDataSource.getProducts(
        ProductFilterParams(page: page),
      );

     
      final products = <ProductEntity>[];
      for (final model in response.data ?? <ProductDataModel>[]) {
        try {
          products.add(_toProductEntity(model));
        } catch (e) {
          // optional: log the bad product
          // print('⚠️ Failed to map product ${model.id}: $e');
        }
      }

      return Success(products);
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return Failure(
        failure.apiErrorModel.message ?? 'Failed to load products',
      );
    }
  }

  ProductEntity _toProductEntity(ProductDataModel model) {
    return ProductEntity(
      id: model.id ?? '',
      title: model.title ?? '',
      price: (model.price ?? 0).toDouble(),
      priceAfterDiscount: model.priceAfterDiscount?.toDouble(),
      description: model.description,
      slug: model.slug,
      imageCover: model.imageCover,

      
      images: model.images ?? const <String>[],
      availableColors: model.availableColors ?? const <String>[],

      quantity: model.quantity,
      sold: model.sold, 
      ratingsAverage: model.ratingsAverage,
      ratingsQuantity: model.ratingsQuantity,
      createdAt: model.createdAt,  
      updatedAt: model.updatedAt,  

      category: model.category == null
          ? null
          : CategoryEntity(
              id: model.category!.id ?? '',
              name: model.category!.name ?? '',
              slug: model.category!.slug,
              image: model.category!.image,  
            ),
      brand: model.brand == null
          ? null
          : BrandEntity(
              id: model.brand!.id ?? '',
              name: model.brand!.name ?? '',
              slug: model.brand!.slug,
              image: model.brand!.image,  
            ),
    );
  }
}

import 'package:route_smart/core/common/domain/entites/product_entity.dart';
import 'pagination_metadata_entity.dart';

class ProductsPageEntity {
  const ProductsPageEntity({
    required this.products,
    required this.metadata,
  });

  final List<ProductEntity> products;
  final PaginationMetadataEntity metadata;
}

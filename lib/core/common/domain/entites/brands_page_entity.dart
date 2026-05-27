import 'package:route_smart/core/common/domain/entites/brand_entity.dart';

import 'pagination_metadata_entity.dart';

class BrandsPageEntity {
  const BrandsPageEntity({
    required this.brands,
    required this.metadata,
  });

  final List<BrandEntity> brands;
  final PaginationMetadataEntity metadata;
}

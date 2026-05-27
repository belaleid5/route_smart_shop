import 'package:route_smart/core/common/domain/entites/category_entity.dart';

import 'pagination_metadata_entity.dart';

class CategoriesPageEntity {
  const CategoriesPageEntity({
    required this.categories,
    required this.metadata,
  });

  final List<CategoryEntity> categories;
  final PaginationMetadataEntity metadata;
}

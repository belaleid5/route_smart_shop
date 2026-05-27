// lib/features/category_details/data/models/subcategory_mapper.dart

import 'package:route_smart/features/category_details/domain/entites/subcategory_entity.dart';
import 'package:route_smart/features/home/data/models/sub_category_response_model.dart';

extension SubcategoryMapper on Subcategory {
  SubcategoryEntity toEntity() {
    return SubcategoryEntity(
      id: id ?? '',
      name: name ?? '',
      slug: slug ?? '',
      category: category ?? '',
    );
  }
}
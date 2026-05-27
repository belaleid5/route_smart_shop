// core/common/data/model/category_response_model.dart

import 'package:route_smart/core/common/data/model/meta_data_model.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';

class CategoryResponseModel {
  const CategoryResponseModel({
    this.results,
    this.metadata,
    this.data,
  });

  final int? results;
  final PaginationMetadataModel? metadata;
  final List<CategoryData>? data;

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponseModel(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : PaginationMetadataModel.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class CategoryData {
  const CategoryData({
    required this.id,
    required this.name,
    this.slug,
    this.image,
  });

  final String id;
  final String name;
  final String? slug;
  final String? image;

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String?,
      image: json['image'] as String?,
    );
  }

  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        name: name,
        slug: slug,
        image: image,
      );
}
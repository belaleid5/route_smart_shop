// core/common/data/model/brand_response_model.dart

import 'package:route_smart/core/common/data/model/meta_data_model.dart';
import 'package:route_smart/core/common/domain/entites/brand_entity.dart';

class BrandResponseModel {
  const BrandResponseModel({
    this.results,
    this.metadata,
    this.data,
  });

  final int? results;
  final PaginationMetadataModel? metadata;
  final List<BrandData>? data;

  factory BrandResponseModel.fromJson(Map<String, dynamic> json) {
    return BrandResponseModel(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : PaginationMetadataModel.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BrandData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class BrandData {
  const BrandData({
    required this.id,
    required this.name,
    this.slug,
    this.image,
  });

  final String id;
  final String name;
  final String? slug;
  final String? image;

  factory BrandData.fromJson(Map<String, dynamic> json) {
    return BrandData(
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String?,
      image: json['image'] as String?,
    );
  }

  BrandEntity toEntity() => BrandEntity(
        id: id,
        name: name,
        slug: slug,
        image: image,
      );
}
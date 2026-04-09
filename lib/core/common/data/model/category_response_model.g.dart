// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponseModel _$CategoryResponseModelFromJson(
  Map<String, dynamic> json,
) => CategoryResponseModel(
  results: (json['results'] as num).toInt(),
  metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
  data: (json['data'] as List<dynamic>)
      .map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoryResponseModelToJson(
  CategoryResponseModel instance,
) => <String, dynamic>{
  'results': instance.results,
  'metadata': instance.metadata,
  'data': instance.data,
};

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
  currentPage: (json['currentPage'] as num).toInt(),
  numberOfPages: (json['numberOfPages'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
);

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
  'currentPage': instance.currentPage,
  'numberOfPages': instance.numberOfPages,
  'limit': instance.limit,
};

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) => CategoryData(
  id: json['_id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  image: json['image'] as String,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
);

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

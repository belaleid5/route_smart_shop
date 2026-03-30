// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubcategoryResponseModel _$SubcategoryResponseModelFromJson(
  Map<String, dynamic> json,
) => SubcategoryResponseModel(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  category: json['category'] as String?,
);

Map<String, dynamic> _$SubcategoryResponseModelToJson(
  SubcategoryResponseModel instance,
) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'category': instance.category,
};

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
};

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
};

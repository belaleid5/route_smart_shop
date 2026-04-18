// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsResponseModel _$ProductDetailsResponseModelFromJson(
  Map<String, dynamic> json,
) => ProductDetailsResponseModel(
  data: json['data'] == null
      ? null
      : ProductDetailsDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductDetailsResponseModelToJson(
  ProductDetailsResponseModel instance,
) => <String, dynamic>{'data': instance.data};

ProductDetailsDataModel _$ProductDetailsDataModelFromJson(
  Map<String, dynamic> json,
) => ProductDetailsDataModel(
  id: json['_id'] as String?,
  title: json['title'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  sold: (json['sold'] as num?)?.toInt(),
  price: (json['price'] as num?)?.toDouble(),
  imageCover: json['imageCover'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
  ratingsQuantity: (json['ratingsQuantity'] as num?)?.toInt(),
  category: json['category'] == null
      ? null
      : CategoryData.fromJson(json['category'] as Map<String, dynamic>),
  brand: json['brand'] == null
      ? null
      : BrandData.fromJson(json['brand'] as Map<String, dynamic>),
  subcategory: (json['subcategory'] as List<dynamic>?)
      ?.map((e) => SubcategoryResponseModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$ProductDetailsDataModelToJson(
  ProductDetailsDataModel instance,
) => <String, dynamic>{
  '_id': instance.id,
  'title': instance.title,
  'slug': instance.slug,
  'description': instance.description,
  'quantity': instance.quantity,
  'sold': instance.sold,
  'price': instance.price,
  'imageCover': instance.imageCover,
  'images': instance.images,
  'ratingsAverage': instance.ratingsAverage,
  'ratingsQuantity': instance.ratingsQuantity,
  'category': instance.category,
  'brand': instance.brand,
  'subcategory': instance.subcategory,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};

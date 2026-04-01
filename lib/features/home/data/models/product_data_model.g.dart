// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDataModel _$ProductDataModelFromJson(
  Map<String, dynamic> json,
) => ProductDataModel(
  sold: json['sold'],
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  subcategory: (json['subcategory'] as List<dynamic>?)
      ?.map((e) => SubcategoryResponseModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  ratingsQuantity: (json['ratingsQuantity'] as num?)?.toInt(),
  mongoId: json['_id'] as String?,
  title: json['title'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  price: (json['price'] as num?)?.toInt(),
  priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toInt(),
  imageCover: json['imageCover'] as String?,
  category: json['category'] == null
      ? null
      : Category.fromJson(json['category'] as Map<String, dynamic>),
  brand: json['brand'] == null
      ? null
      : Brand.fromJson(json['brand'] as Map<String, dynamic>),
  ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  id: json['id'] as String?,
);

Map<String, dynamic> _$ProductDataModelToJson(ProductDataModel instance) =>
    <String, dynamic>{
      'sold': instance.sold,
      'images': instance.images,
      'subcategory': instance.subcategory,
      'ratingsQuantity': instance.ratingsQuantity,
      '_id': instance.mongoId,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'quantity': instance.quantity,
      'price': instance.price,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'imageCover': instance.imageCover,
      'category': instance.category,
      'brand': instance.brand,
      'ratingsAverage': instance.ratingsAverage,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
    };

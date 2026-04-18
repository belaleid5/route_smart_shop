// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistResponseModel _$WishlistResponseModelFromJson(
  Map<String, dynamic> json,
) => WishlistResponseModel(
  status: json['status'] as String,
  count: (json['count'] as num).toInt(),
  items: (json['data'] as List<dynamic>)
      .map((e) => WishlistItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WishlistResponseModelToJson(
  WishlistResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'count': instance.count,
  'data': instance.items,
};

WishlistItemModel _$WishlistItemModelFromJson(
  Map<String, dynamic> json,
) => WishlistItemModel(
  id: json['_id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  price: json['price'] as num,
  priceAfterDiscount: json['priceAfterDiscount'] as num?,
  imageCover: json['imageCover'] as String,
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  quantity: (json['quantity'] as num).toInt(),
  sold: (json['sold'] as num).toInt(),
  ratingsAverage: json['ratingsAverage'] as num?,
  category: WishlistCategory.fromJson(json['category'] as Map<String, dynamic>),
  brand: json['brand'] == null
      ? null
      : WishlistBrand.fromJson(json['brand'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WishlistItemModelToJson(WishlistItemModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'imageCover': instance.imageCover,
      'images': instance.images,
      'quantity': instance.quantity,
      'sold': instance.sold,
      'ratingsAverage': instance.ratingsAverage,
      'category': instance.category,
      'brand': instance.brand,
    };

WishlistCategory _$WishlistCategoryFromJson(Map<String, dynamic> json) =>
    WishlistCategory(id: json['_id'] as String, name: json['name'] as String);

Map<String, dynamic> _$WishlistCategoryToJson(WishlistCategory instance) =>
    <String, dynamic>{'_id': instance.id, 'name': instance.name};

WishlistBrand _$WishlistBrandFromJson(Map<String, dynamic> json) =>
    WishlistBrand(id: json['_id'] as String, name: json['name'] as String);

Map<String, dynamic> _$WishlistBrandToJson(WishlistBrand instance) =>
    <String, dynamic>{'_id': instance.id, 'name': instance.name};

// lib/features/wishlist/data/models/wishlist_item_model.dart

import 'package:route_smart/core/common/data/model/brand_response_model.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/features/wishlist/domain/entites/wishlist_entity.dart';

class WishlistItemModel {
  const WishlistItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageCover,
    required this.images,
    required this.quantity,
    required this.sold,
    this.priceAfterDiscount,
    this.ratingsAverage,
    required this.category,
    this.brand,
  });

  final String id;
  final String title;
  final String description;
  final double price;
  final String imageCover;
  final List<String> images;
  final int quantity;
  final int sold;
  final double? priceAfterDiscount;
  final double? ratingsAverage;
  final CategoryData category;
  final BrandData? brand;

  factory WishlistItemModel.fromJson(Map<String, dynamic> json) {
    return WishlistItemModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toDouble(),
      imageCover: json['imageCover'] as String,
      images: (json['images'] as List<dynamic>? ?? [])
          .map((e) => e as String)
          .toList(),
      quantity: json['quantity'] as int,
      sold: json['sold'] as int,
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
      category: CategoryData.fromJson(json['category'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : BrandData.fromJson(json['brand'] as Map<String, dynamic>),
    );
  }

  WishlistEntity toEntity() {
    return WishlistEntity(
      id: id,
      title: title,
      description: description,
      price: price,
      imageCover: imageCover,
      images: images,
      quantity: quantity,
      sold: sold,
      priceAfterDiscount: priceAfterDiscount,
      ratingsAverage: ratingsAverage,
      category: category.toEntity(),
      brand: brand?.toEntity(),
    );
  }
}

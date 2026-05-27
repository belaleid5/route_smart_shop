// features/details/data/models/product_details_response_model.dart

import 'package:route_smart/features/details/domain/entites/product_details_entit.dart';

class ProductDetailsResponseModel {
  final ProductDetailsDataModel? data;

  const ProductDetailsResponseModel({this.data});

  factory ProductDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsResponseModel(
      data: json['data'] != null
          ? ProductDetailsDataModel.fromJson(json['data'])
          : null,
    );
  }
}

class ProductDetailsDataModel {
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? sold;
  final double? price;
  final String? imageCover;
  final List<String>? images;
  final double? ratingsAverage;
  final int? ratingsQuantity;

  const ProductDetailsDataModel({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.sold,
    this.price,
    this.imageCover,
    this.images,
    this.ratingsAverage,
    this.ratingsQuantity,
  });

  factory ProductDetailsDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsDataModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      quantity: json['quantity'] as int?,
      sold: json['sold'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      imageCover: json['imageCover'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
      ratingsQuantity: json['ratingsQuantity'] as int?,
    );
  }

 
  ProductDetailsEntity toEntity() {
    return ProductDetailsEntity(
      id: id ?? '',
      title: title ?? '',
      slug: slug ?? '',
      description: description ?? '',
      quantity: quantity ?? 0,  
      sold: sold ?? 0,         
      price: price ?? 0.0,
      imageCover: imageCover ?? '',
      images: images ?? [],
      ratingsAverage: ratingsAverage ?? 0.0,
      ratingsQuantity: ratingsQuantity ?? 0,
      category: null,
      brand: null,
      createdAt: null,
      updatedAt: null,
    );
  }
}
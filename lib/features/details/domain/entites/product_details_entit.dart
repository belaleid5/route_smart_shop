// features/details/domain/entities/product_details_entity.dart


import 'package:route_smart/core/common/domain/entites/brand_entity.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';

class ProductDetailsEntity {
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final int sold;
  final double price;
  final String imageCover;
  final List<String> images;
  final double ratingsAverage;
  final int ratingsQuantity;
  final CategoryEntity? category;
  final BrandEntity? brand;
  final String? createdAt;
  final String? updatedAt;

  const ProductDetailsEntity({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.sold,
    required this.price,
    required this.imageCover,
    required this.images,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    this.category,
    this.brand,
    this.createdAt,
    this.updatedAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDetailsEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          slug == other.slug &&
          description == other.description &&
          quantity == other.quantity &&
          sold == other.sold &&
          price == other.price &&
          imageCover == other.imageCover &&
          images == other.images &&
          ratingsAverage == other.ratingsAverage &&
          ratingsQuantity == other.ratingsQuantity &&
          category == other.category &&
          brand == other.brand &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      slug.hashCode ^
      description.hashCode ^
      quantity.hashCode ^
      sold.hashCode ^
      price.hashCode ^
      imageCover.hashCode ^
      images.hashCode ^
      ratingsAverage.hashCode ^
      ratingsQuantity.hashCode ^
      category.hashCode ^
      brand.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
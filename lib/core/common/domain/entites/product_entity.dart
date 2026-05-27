// core/common/domain/entities/product_entity.dart

import 'package:route_smart/core/common/domain/entites/brand_entity.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';

class ProductEntity {
  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    this.description,
    this.slug,
    this.imageCover,
    this.images = const [],          
    this.availableColors = const [], 
    this.quantity,
    this.sold,
    this.ratingsAverage,
    this.ratingsQuantity,
    this.priceAfterDiscount,
    this.category,
    this.brand,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String title;
  final double price;
  final double? priceAfterDiscount;
  final String? description;
  final String? slug;
  final String? imageCover;
  final List<String> images;         
  final List<String> availableColors; 
  final int? quantity;
  final int? sold;                    
  final double? ratingsAverage;
  final int? ratingsQuantity;
  final CategoryEntity? category;
  final BrandEntity? brand;
  final DateTime? createdAt;          
  final DateTime? updatedAt;        


  bool get hasDiscount =>
      priceAfterDiscount != null && priceAfterDiscount! < price;

  double get effectivePrice => hasDiscount ? priceAfterDiscount! : price;

  int get discountPercentage {
    if (!hasDiscount || price == 0) return 0;
    return (((price - priceAfterDiscount!) / price) * 100).round();
  }


  String? get displayImage {
    if (imageCover != null && imageCover!.isNotEmpty) return imageCover;
    if (images.isNotEmpty) return images.first;
    return null;
  }

  List<String> get allImages {
    final result = <String>{};
    if (imageCover != null && imageCover!.isNotEmpty) result.add(imageCover!);
    result.addAll(images);
    return result.toList();
  }

  bool get isInStock => (quantity ?? 0) > 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

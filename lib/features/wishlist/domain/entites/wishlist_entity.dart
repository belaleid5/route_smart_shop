// features/wishlist/domain/entities/wishlist_entity.dart

import 'package:route_smart/core/common/domain/entites/brand_entity.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';

class WishlistEntity {
  const WishlistEntity({
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
  final double? priceAfterDiscount;
  final String imageCover;
  final List<String> images;
  final int quantity;
  final int sold;
  final double? ratingsAverage;
  final CategoryEntity category;
  final BrandEntity? brand;

  bool get hasDiscount =>
      priceAfterDiscount != null && priceAfterDiscount! < price;

  double get effectivePrice => hasDiscount ? priceAfterDiscount! : price;
}


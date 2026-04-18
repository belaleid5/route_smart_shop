import 'package:json_annotation/json_annotation.dart';
part 'wishlist_response_model.g.dart';

@JsonSerializable()
class WishlistResponseModel {
  final String status;
  final int count;
  @JsonKey(name: 'data') final List<WishlistItemModel> items;

  WishlistResponseModel({
    required this.status,
    required this.count,
    required this.items,
  });

  factory WishlistResponseModel.fromJson(Map<String, dynamic> j) =>
      _$WishlistResponseModelFromJson(j);
}

@JsonSerializable()
class WishlistItemModel {
  @JsonKey(name: '_id') final String id;
  final String title;
  final String description;
  final num price;
  @JsonKey(name: 'priceAfterDiscount') final num? priceAfterDiscount;
  @JsonKey(name: 'imageCover') final String imageCover;
  final List<String> images;
  final int quantity;
  final int sold;
  @JsonKey(name: 'ratingsAverage') final num? ratingsAverage;
  final WishlistCategory category;
  final WishlistBrand? brand;

  WishlistItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.priceAfterDiscount,
    required this.imageCover,
    required this.images,
    required this.quantity,
    required this.sold,
    this.ratingsAverage,
    required this.category,
    this.brand,
  });

  factory WishlistItemModel.fromJson(Map<String, dynamic> j) =>
      _$WishlistItemModelFromJson(j);

  double get priceDouble => price.toDouble();
  double? get priceAfterDiscountDouble => priceAfterDiscount?.toDouble();

  /// هل فيه خصم فعلي؟
  bool get hasDiscount =>
      priceAfterDiscount != null &&
      priceAfterDiscount!.toDouble() < price.toDouble();
}

@JsonSerializable()
class WishlistCategory {
  @JsonKey(name: '_id') final String id;
  final String name;

  WishlistCategory({required this.id, required this.name});

  factory WishlistCategory.fromJson(Map<String, dynamic> j) =>
      _$WishlistCategoryFromJson(j);
}

@JsonSerializable()
class WishlistBrand {
  @JsonKey(name: '_id') final String id;
  final String name;

  WishlistBrand({required this.id, required this.name});

  factory WishlistBrand.fromJson(Map<String, dynamic> j) =>
      _$WishlistBrandFromJson(j);
}
// wishlist_response_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'wishlist_response_model.g.dart';

@JsonSerializable()
class WishlistResponseModel {
  final String statusMsg;
  final String message;
  final List<WishlistItemModel> data;

  WishlistResponseModel({
    required this.statusMsg,
    required this.message,
    required this.data,
  });

  factory WishlistResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WishlistResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WishlistResponseModelToJson(this);
}

@JsonSerializable()
class WishlistItemModel {
  final String id;
  final ProductInfoModel product;
  final String createdAt;

  WishlistItemModel({
    required this.id,
    required this.product,
    required this.createdAt,
  });

  factory WishlistItemModel.fromJson(Map<String, dynamic> json) =>
      _$WishlistItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$WishlistItemModelToJson(this);
}

@JsonSerializable()
class ProductInfoModel {
  final String id;
  final String title;
  final String imageCover;
  final int price;
  final String? description;
  final double? ratingsAverage;

  ProductInfoModel({
    required this.id,
    required this.title,
    required this.imageCover,
    required this.price,
    this.description,
    this.ratingsAverage,
  });

  factory ProductInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductInfoModelToJson(this);
}
import 'package:json_annotation/json_annotation.dart';
import 'package:route_smart/core/common/data/model/brand_response_model.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/features/home/data/models/sub_category_response_model.dart';

part 'product_details_response_model.g.dart';

@JsonSerializable()
class ProductDetailsResponseModel {
  @JsonKey(name: 'data')
  final ProductDetailsDataModel? data;

  const ProductDetailsResponseModel({this.data});

  factory ProductDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsResponseModelToJson(this);
}

@JsonSerializable()
class ProductDetailsDataModel {
  @JsonKey(name: '_id')
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

  @JsonKey(name: 'category')
  final CategoryData? category;     

  @JsonKey(name: 'brand')
  final BrandData? brand;         

  @JsonKey(name: 'subcategory')
  final List<SubcategoryResponseModel>? subcategory;

  final String? createdAt;
  final String? updatedAt;

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
    this.category,
    this.brand,
    this.subcategory,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductDetailsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsDataModelToJson(this);
}
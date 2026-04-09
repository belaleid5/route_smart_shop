import 'package:json_annotation/json_annotation.dart';
import 'package:route_smart/features/home/data/models/sub_category_response_model.dart';

part 'product_data_model.g.dart';

@JsonSerializable()
class ProductDataModel {
  final dynamic sold; // dynamic because it can be int, double, or null
  final List<String>? images;
  final List<SubcategoryResponseModel>? subcategory;
  final int? ratingsQuantity;
  @JsonKey(name: '_id')
  final String? mongoId;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final int? priceAfterDiscount;
  final String? imageCover;
  
  final Category? category;
  final Brand? brand;
  
  final double? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;
  final String? id;

  ProductDataModel({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.mongoId,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.priceAfterDiscount,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) => _$ProductDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDataModelToJson(this);
}
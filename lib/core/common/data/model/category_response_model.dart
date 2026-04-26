import 'package:json_annotation/json_annotation.dart';
import 'package:route_smart/core/common/data/model/product_response_model.dart';

part 'category_response_model.g.dart';

@JsonSerializable()
class CategoryResponseModel {
  final int? results;
  final Metadata? metadata;
  final List<CategoryData>? data;

  const CategoryResponseModel({this.results, this.metadata, this.data});

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseModelToJson(this);
}

@JsonSerializable()
class CategoryData {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  const CategoryData({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}

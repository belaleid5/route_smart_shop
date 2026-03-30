import 'package:json_annotation/json_annotation.dart';

part 'sub_category_response_model.g.dart';


@JsonSerializable()
class SubcategoryResponseModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? category;

  SubcategoryResponseModel({this.id, this.name, this.slug, this.category});

  factory SubcategoryResponseModel.fromJson(Map<String, dynamic> json) => _$SubcategoryResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubcategoryResponseModelToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  Category({this.id, this.name, this.slug, this.image});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Brand {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  Brand({this.id, this.name, this.slug, this.image});

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
  Map<String, dynamic> toJson() => _$BrandToJson(this);
}
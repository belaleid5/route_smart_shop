import 'package:json_annotation/json_annotation.dart';

part 'brand_response_model.g.dart';

@JsonSerializable()
class BrandResponseModel {
  final int? results;
  final Metadata? metadata;
  final List<BrandData>? data;

  BrandResponseModel({this.results, this.metadata, this.data});

  factory BrandResponseModel.fromJson(Map<String, dynamic> json) => _$BrandResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$BrandResponseModelToJson(this);
}

@JsonSerializable()
class Metadata {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;
  final int? nextPage;

  Metadata({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  factory Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);
  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class BrandData {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  BrandData({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory BrandData.fromJson(Map<String, dynamic> json) => _$BrandDataFromJson(json);
  Map<String, dynamic> toJson() => _$BrandDataToJson(this);
}
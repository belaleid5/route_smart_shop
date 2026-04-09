import 'package:json_annotation/json_annotation.dart';

part 'category_response_model.g.dart';

@JsonSerializable()
class CategoryResponseModel {
  final int results;
  final Metadata metadata;
  final List<CategoryData> data;

  CategoryResponseModel({required this.results, required this.metadata, required this.data});

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseModelToJson( this);
}

@JsonSerializable()
class Metadata {
  final int currentPage;
  final int numberOfPages;
  final int limit;

  Metadata({required this.currentPage, required this.numberOfPages, required this.limit});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
  Map<String, dynamic> toJson() => _$MetadataToJson( this);
}

@JsonSerializable()
class CategoryData {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String slug;
  final String image;
  final String createdAt;
  final String updatedAt;

  CategoryData({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryDataToJson( this);
}

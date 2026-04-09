import 'package:json_annotation/json_annotation.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';

part 'product_response_model.g.dart';

@JsonSerializable()
class ProductResponseModel {
  final int? results;
  final Metadata? metadata;
  final List<ProductDataModel>? data;

  ProductResponseModel({this.results, this.metadata, this.data});

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) => _$ProductResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseModelToJson(this);
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
import 'package:json_annotation/json_annotation.dart';

part 'reviews_metadata_model.g.dart';

@JsonSerializable()
class ReviewsMetadataModel {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int? nextPage;

  const ReviewsMetadataModel({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    this.nextPage,
  });

  factory ReviewsMetadataModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewsMetadataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsMetadataModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:route_smart/features/reviews/data/models/review_model.dart';
import 'package:route_smart/features/reviews/data/models/reviews_metadata_model.dart';

part 'reviews_response_model.g.dart';

@JsonSerializable()
class ReviewsResponseModel {
  final int results;
  final ReviewsMetadataModel metadata;
  final List<ReviewModel> data;

  const ReviewsResponseModel({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory ReviewsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsResponseModelToJson(this);
}

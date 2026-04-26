import 'package:json_annotation/json_annotation.dart';

part 'create_review_request_model.g.dart';

@JsonSerializable()
class CreateReviewRequestModel {
  final String review;
  final num rating;

  const CreateReviewRequestModel({
    required this.review,
    required this.rating,
  });

  factory CreateReviewRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateReviewRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReviewRequestModelToJson(this);
}

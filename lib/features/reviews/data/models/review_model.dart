import 'package:json_annotation/json_annotation.dart';
import 'package:route_smart/features/reviews/data/models/review_user_model.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  @JsonKey(name: '_id')
  final String id;
  final String review;
  final num rating;
  final String product;
  final ReviewUserModel user;
  final String createdAt;
  final String updatedAt;

  const ReviewModel({
    required this.id,
    required this.review,
    required this.rating,
    required this.product,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}

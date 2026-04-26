// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_review_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReviewRequestModel _$CreateReviewRequestModelFromJson(
  Map<String, dynamic> json,
) => CreateReviewRequestModel(
  review: json['review'] as String,
  rating: json['rating'] as num,
);

Map<String, dynamic> _$CreateReviewRequestModelToJson(
  CreateReviewRequestModel instance,
) => <String, dynamic>{'review': instance.review, 'rating': instance.rating};

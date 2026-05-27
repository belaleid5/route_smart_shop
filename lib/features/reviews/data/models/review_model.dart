import 'package:route_smart/features/reviews/domain/entites/review_entity.dart';

import 'review_user_model.dart';

class ReviewModel extends ReviewEntity {
  const ReviewModel({
    super.id,
    super.review,
    super.rating,
    super.product,
    super.user,
    super.createdAt,
    super.updatedAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['_id'] as String?,
      review: json['review'] as String?,
      rating: json['rating'] as num?,
      product: json['product'] as String?,
      user: json['user'] != null
          ? ReviewUserModel.fromJson(json['user'])
          : null,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }
}

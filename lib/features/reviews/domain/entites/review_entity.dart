import 'review_user_entity.dart';

class ReviewEntity {
  final String? id;
  final String? review;
  final num? rating;
  final String? product;
  final ReviewUserEntity? user;
  final String? createdAt;
  final String? updatedAt;

  const ReviewEntity({
    this.id,
    this.review,
    this.rating,
    this.product,
    this.user,
    this.createdAt,
    this.updatedAt,
  });
}

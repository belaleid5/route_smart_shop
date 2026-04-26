import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_events.freezed.dart';

@freezed
sealed class ReviewsEvent with _$ReviewsEvent {
  const factory ReviewsEvent.getProductReviews({
    required String productId,
    int? page,
  }) = GetProductReviewsEvent;

  const factory ReviewsEvent.createReview({
    required String productId,
    required String review,
    required double rating,
  }) = CreateReviewEvent;

  const factory ReviewsEvent.updateReview({
    required String productId,
    required String reviewId,
    required String review,
    required double rating,
  }) = UpdateReviewEvent;

  const factory ReviewsEvent.deleteReview({
    required String productId,
    required String reviewId,
  }) = DeleteReviewEvent;
}


import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/reviews/domain/entites/review_entity.dart';
import 'package:route_smart/features/reviews/domain/entites/reviews_response_entity.dart';

abstract class ReviewsRepository {
  Future<ApiResult<ReviewsResponseEntity>> getProductReviews(String productId, int? page);
  Future<ApiResult<ReviewsResponseEntity>> getAllReviews(int? page);
  Future<ApiResult<ReviewEntity>> getReviewById(String id);
  Future<ApiResult<void>> createReview(String productId, String review, double rating);
  Future<ApiResult<void>> updateReview(String reviewId, String review, num rating);
  Future<ApiResult<void>> deleteReview(String reviewId);
}

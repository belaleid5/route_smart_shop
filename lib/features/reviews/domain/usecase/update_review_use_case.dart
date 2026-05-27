import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/reviews/domain/repo/reviews_repository.dart';

class UpdateReviewUseCase {
  final ReviewsRepository _repository;

  UpdateReviewUseCase(this._repository);

  Future<ApiResult<void>> call({
    required String reviewId,
    required String review,
    required num rating,
  }) {
    return _repository.updateReview(reviewId, review, rating);
  }
}

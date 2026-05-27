

import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/reviews/domain/repo/reviews_repository.dart';

class DeleteReviewUseCase {
  final ReviewsRepository _repository;

  DeleteReviewUseCase(this._repository);

  Future<ApiResult<void>> call(String reviewId) {
    return _repository.deleteReview(reviewId);
  }
}

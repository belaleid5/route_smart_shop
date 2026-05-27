

import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/reviews/domain/repo/reviews_repository.dart';

class CreateReviewUseCase {
  final ReviewsRepository _repository;

  CreateReviewUseCase(this._repository);

  Future<ApiResult<void>> call({
    required String productId,
    required String review,
    required double rating,
  }) {
    return _repository.createReview(productId, review, rating);
  }
}

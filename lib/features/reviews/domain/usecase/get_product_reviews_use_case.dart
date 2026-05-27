

import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/reviews/domain/entites/reviews_response_entity.dart';
import 'package:route_smart/features/reviews/domain/repo/reviews_repository.dart';

class GetProductReviewsUseCase {
  final ReviewsRepository _repository;

  GetProductReviewsUseCase(this._repository);

  Future<ApiResult<ReviewsResponseEntity>> call({
    required String productId,
    int? page,
  }) {
    return _repository.getProductReviews(productId, page);
  }
}

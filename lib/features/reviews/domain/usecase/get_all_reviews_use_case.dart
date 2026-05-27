

import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/reviews/domain/entites/reviews_response_entity.dart';
import 'package:route_smart/features/reviews/domain/repo/reviews_repository.dart';

class GetAllReviewsUseCase {
  final ReviewsRepository _repository;

  GetAllReviewsUseCase(this._repository);

  Future<ApiResult<ReviewsResponseEntity>> call({int? page}) {
    return _repository.getAllReviews(page);
  }
}

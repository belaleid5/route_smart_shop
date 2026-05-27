import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/reviews/domain/entites/review_entity.dart';
import 'package:route_smart/features/reviews/domain/entites/reviews_response_entity.dart';
import 'package:route_smart/features/reviews/domain/repo/reviews_repository.dart';

class GetReviewByIdUseCase {
  final ReviewsRepository _repository;

  GetReviewByIdUseCase(this._repository);

  Future<ApiResult<ReviewEntity>> call(String id) {
    return _repository.getReviewById(id);
  }
}

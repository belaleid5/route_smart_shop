import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/core/services/flutter_secure.dart';
import 'package:route_smart/core/services/shared_pref/shared_keys.dart';
import 'package:route_smart/features/reviews/data/models/create_review_request_model.dart';
import 'package:route_smart/features/reviews/data/models/review_model.dart';
import 'package:route_smart/features/reviews/data/models/reviews_response_model.dart';

abstract class ReviewsRemoteDataSource {
  Future<ReviewsResponseModel> getProductReviews(
    String productId,
    int? page,
  );

  Future<ReviewsResponseModel> getAllReviews(int? page);

  Future<ReviewModel> getReviewById(String id);

  Future<void> createReview(
    String productId,
    String review,
    num rating,
  );

  Future<void> updateReview(
    String reviewId,
    String review,
    num rating,
  );

  Future<void> deleteReview(String reviewId);
}

class ReviewsRemoteDataSourceImpl implements ReviewsRemoteDataSource {
  final ApiService _apiService;
  final SecureStorage _secureStorage;

  ReviewsRemoteDataSourceImpl(this._apiService, this._secureStorage);

  @override
  Future<ReviewsResponseModel> getProductReviews(
    String productId,
    int? page,
  ) async {
    return _apiService.getProductReviews(page:  page, productId: productId);
  }

  @override
  Future<ReviewsResponseModel> getAllReviews(int? page) async {
    return _apiService.getAllReviews(page: page);
  }

  @override
  Future<ReviewModel> getReviewById(String id) async {
    return _apiService.getReviewById(id);
  }

  @override
  Future<void> createReview(
    String productId,
    String review,
    num rating,
  ) async {
    final token = await _secureStorage.getString(PrefKeys.accessToken);
    if (token == null || token.isEmpty) {
      throw Exception('Unauthenticated');
    }

    await _apiService.createReview(
      token,
      productId,
      CreateReviewRequestModel(review: review, rating: rating),
    );
  }

  @override
  Future<void> updateReview(
    String reviewId,
    String review,
    num rating,
  ) async {
    final token = await _secureStorage.getString(PrefKeys.accessToken);
    if (token == null || token.isEmpty) {
      throw Exception('Unauthenticated');
    }

    await _apiService.updateReview(
      token,
      reviewId,
      CreateReviewRequestModel(review: review, rating: rating),
    );
  }

  @override
  Future<void> deleteReview(String reviewId) async {
    final token = await _secureStorage.getString(PrefKeys.accessToken);
    if (token == null || token.isEmpty) {
      throw Exception('Unauthenticated');
    }

    return _apiService.deleteReview(token, reviewId);
  }
}
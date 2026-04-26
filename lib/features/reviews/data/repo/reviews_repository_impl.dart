import 'dart:io';

import 'package:dio/dio.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/reviews/data/data_source/reviews_remote_data_source.dart';
import 'package:route_smart/features/reviews/data/models/review_model.dart';
import 'package:route_smart/features/reviews/data/models/reviews_response_model.dart';

class ReviewsRepository {
  final ReviewsRemoteDataSource _dataSource;

  ReviewsRepository(this._dataSource);

  Future<ApiResult<ReviewsResponseModel>> getProductReviews(
    String productId,
    int? page,
  ) async {
    try {
      final response = await _dataSource.getProductReviews(productId, page);
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(_handleError(e));
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<ReviewsResponseModel>> getAllReviews(int? page) async {
    try {
      final response = await _dataSource.getAllReviews(page);
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(_handleError(e));
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<ReviewModel>> getReviewById(String id) async {
    try {
      final response = await _dataSource.getReviewById(id);
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(_handleError(e));
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<void>> createReview(
    String productId,
    String review,
    double rating,
  ) async {
    try {
      await _dataSource.createReview(
        productId,
        review,
        rating,
      );
      return const ApiResult.success(null);
    } on DioException catch (e) {
      return ApiResult.failure(_handleError(e));
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<void>> updateReview(
    String reviewId,
    String review,
    num rating,
  ) async {
    try {
      await _dataSource.updateReview(
        reviewId,
        review,
        rating,
      );
      return const ApiResult.success(null);
    } on DioException catch (e) {
      return ApiResult.failure(_handleError(e));
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<void>> deleteReview(String reviewId) async {
    try {
      await _dataSource.deleteReview(reviewId);
      return const ApiResult.success(null);
    } on DioException catch (e) {
      return ApiResult.failure(_handleError(e));
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  String _handleError(DioException error) {
    if (error.error is HandshakeException) {
      return 'Security error — please check your device date and time';
    }
    if (error.response != null) {
      return error.response?.data['message'] ?? 'A server error occurred';
    }
    return 'Check your internet connection';
  }
}
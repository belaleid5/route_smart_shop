import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/reviews/domain/usecase/create_review_use_case.dart';
import 'package:route_smart/features/reviews/domain/usecase/delete_review_use_case.dart';
import 'package:route_smart/features/reviews/domain/usecase/get_product_reviews_use_case.dart';
import 'package:route_smart/features/reviews/domain/usecase/update_review_use_case.dart';
import 'package:route_smart/features/reviews/presention/manger/review_events.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final GetProductReviewsUseCase _getProductReviewsUseCase;
  final CreateReviewUseCase _createReviewUseCase;
  final DeleteReviewUseCase _deleteReviewUseCase;
  final UpdateReviewUseCase _updateReviewUseCase;

  ReviewsBloc(
    this._getProductReviewsUseCase,
    this._createReviewUseCase,
    this._deleteReviewUseCase,
    this._updateReviewUseCase,
  ) : super(const ReviewsInitial()) {
    on<ProductReviewsRequested>(_onProductReviewsRequested);
    on<ReviewCreateRequested>(_onReviewCreateRequested);
    on<ReviewDeleteRequested>(_onReviewDeleteRequested);
    on<ReviewUpdateRequested>(_onReviewUpdateRequested);
  }

  Future<void> _onProductReviewsRequested(
    ProductReviewsRequested event,
    Emitter<ReviewsState> emit,
  ) async {
    emit(const ReviewsInProgress());
    final result = await _getProductReviewsUseCase(productId: event.productId);
    switch (result) {
      case Success(:final data):
        emit(ReviewsSuccess(data));
      case Failure(:final message):
        emit(ReviewsFailure(message));
    }
  }

  Future<void> _onReviewCreateRequested(
    ReviewCreateRequested event,
    Emitter<ReviewsState> emit,
  ) async {
    emit(const ReviewActionInProgress());
    final result = await _createReviewUseCase(
      productId: event.productId,
      review: event.reviewText,
      rating: event.rating,
    );
    switch (result) {
      case Success():
        emit(const ReviewCreated());
        add(ProductReviewsRequested(event.productId));
      case Failure(:final message):
        emit(ReviewActionFailure(message));
    }
  }

  Future<void> _onReviewDeleteRequested(
    ReviewDeleteRequested event,
    Emitter<ReviewsState> emit,
  ) async {
    emit(const ReviewActionInProgress());
    final result = await _deleteReviewUseCase(event.reviewId);
    switch (result) {
      case Success():
        emit(const ReviewDeleted());
        add(ProductReviewsRequested(event.productId));
      case Failure(:final message):
        emit(ReviewActionFailure(message));
    }
  }

  Future<void> _onReviewUpdateRequested(
    ReviewUpdateRequested event,
    Emitter<ReviewsState> emit,
  ) async {
    emit(const ReviewActionInProgress());
    final result = await _updateReviewUseCase(
      reviewId: event.reviewId,
      review: event.reviewText,
      rating: event.rating,
    );
    switch (result) {
      case Success():
        emit(const ReviewUpdated());
        add(ProductReviewsRequested(event.productId));
      case Failure(:final message):
        emit(ReviewActionFailure(message));
    }
  }
}
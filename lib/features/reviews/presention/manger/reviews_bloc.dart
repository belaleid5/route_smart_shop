import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/reviews/data/repo/reviews_repository_impl.dart';
import 'package:route_smart/features/reviews/presention/manger/review_events.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final ReviewsRepository _repository;

  ReviewsBloc(this._repository) : super(const ReviewsState.initial()) {
    on<GetProductReviewsEvent>(_onGetProductReviews);
    on<CreateReviewEvent>(_onCreateReview);
    on<UpdateReviewEvent>(_onUpdateReview);
    on<DeleteReviewEvent>(_onDeleteReview);
  }

  Future<void> _onGetProductReviews(GetProductReviewsEvent event, Emitter<ReviewsState> emit) async {
    emit(const ReviewsState.loading());
    final result = await _repository.getProductReviews(event.productId, event.page);
    result.when(
      success: (response) => emit(ReviewsState.success(response)),
      failure: (error) => emit(ReviewsState.error(error)),
    );
  }

  Future<void> _onCreateReview(CreateReviewEvent event, Emitter<ReviewsState> emit) async {
    emit(const ReviewsState.actionLoading());
    final result = await _repository.createReview(event.productId, event.review, event.rating);
    result.when(
      success: (_) {
        emit(const ReviewsState.reviewCreated());
        add(ReviewsEvent.getProductReviews(productId: event.productId));
      },
      failure: (error) => emit(ReviewsState.actionError(error)),
    );
  }

  Future<void> _onUpdateReview(UpdateReviewEvent event, Emitter<ReviewsState> emit) async {
    emit(const ReviewsState.actionLoading());
    final result = await _repository.updateReview(event.reviewId, event.review, 
    event.rating);
    result.when(
      success: (_) {
        emit(const ReviewsState.reviewUpdated());
        add(ReviewsEvent.getProductReviews(productId: event.productId));
      },
      failure: (error) => emit(ReviewsState.actionError(error)),
    );
  }

  Future<void> _onDeleteReview(DeleteReviewEvent event, Emitter<ReviewsState> emit) async {
    emit(const ReviewsState.actionLoading());
    final result = await _repository.deleteReview(event.reviewId);
    result.when(
      success: (_) {
        emit(const ReviewsState.reviewDeleted());
        add(ReviewsEvent.getProductReviews(productId: event.productId));
      },
      failure: (error) => emit(ReviewsState.actionError(error)),
    );
  }
}
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/features/reviews/data/models/reviews_response_model.dart';

part 'reviews_state.freezed.dart';

@freezed
class ReviewsState with _$ReviewsState {
  const factory ReviewsState.initial() = _Initial;
  const factory ReviewsState.loading() = _Loading;
  const factory ReviewsState.success(ReviewsResponseModel response) = _Success;
  const factory ReviewsState.error(String message) = _Error;

  const factory ReviewsState.actionLoading() = _ActionLoading;
  const factory ReviewsState.reviewCreated() = _ReviewCreated;
  const factory ReviewsState.reviewUpdated() = _ReviewUpdated;
  const factory ReviewsState.reviewDeleted() = _ReviewDeleted;
  const factory ReviewsState.actionError(String message) = _ActionError;
}
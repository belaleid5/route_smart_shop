import 'package:route_smart/features/reviews/domain/entites/reviews_response_entity.dart';

sealed class ReviewsState {
  const ReviewsState();
}

final class ReviewsInitial extends ReviewsState {
  const ReviewsInitial();
}

final class ReviewsInProgress extends ReviewsState {
  const ReviewsInProgress();
}

final class ReviewsSuccess extends ReviewsState {
  final ReviewsResponseEntity response; // ✅ Entity

  const ReviewsSuccess(this.response);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewsSuccess &&
          runtimeType == other.runtimeType &&
          response == other.response;

  @override
  int get hashCode => response.hashCode;
}

final class ReviewsFailure extends ReviewsState { 
  final String message;

  const ReviewsFailure(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewsFailure &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

final class ReviewActionInProgress extends ReviewsState {
  const ReviewActionInProgress();
}

final class ReviewCreated extends ReviewsState {
  const ReviewCreated();
}

final class ReviewUpdated extends ReviewsState {
  const ReviewUpdated();
}

final class ReviewDeleted extends ReviewsState {
  const ReviewDeleted();
}

final class ReviewActionFailure extends ReviewsState {
  final String message;

  const ReviewActionFailure(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewActionFailure &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}
sealed class ReviewsEvent {
  const ReviewsEvent();
}

final class ProductReviewsRequested extends ReviewsEvent {
  final String productId;
  const ProductReviewsRequested(this.productId);
}

final class ReviewDeleteRequested extends ReviewsEvent {
  final String productId;
  final String reviewId;

  const ReviewDeleteRequested({
    required this.productId,
    required this.reviewId,
  });
}

final class ReviewCreateRequested extends ReviewsEvent {
  final String productId;
  final String reviewText;
  final double rating; 

  const ReviewCreateRequested({
    required this.productId,
    required this.reviewText,
    required this.rating,
  });
}

final class ReviewUpdateRequested extends ReviewsEvent {
  final String productId;
  final String reviewId;
  final String reviewText;
  final double rating; 

  const ReviewUpdateRequested({
    required this.productId,
    required this.reviewId,
    required this.reviewText,
    required this.rating,
  });
}
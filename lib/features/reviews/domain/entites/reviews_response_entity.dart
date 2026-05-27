import 'review_entity.dart';
import 'reviews_metadata_entity.dart';

class ReviewsResponseEntity {
  final int? results;
  final ReviewsMetadataEntity? metadata;
  final List<ReviewEntity>? data;

  const ReviewsResponseEntity({
    this.results,
    this.metadata,
    this.data,
  });
}

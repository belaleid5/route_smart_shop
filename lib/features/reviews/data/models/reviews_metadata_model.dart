
import 'package:route_smart/features/reviews/domain/entites/reviews_metadata_entity.dart';

class ReviewsMetadataModel extends ReviewsMetadataEntity {
  const ReviewsMetadataModel({
    super.currentPage,
    super.numberOfPages,
    super.limit,
    super.nextPage,
  });

  factory ReviewsMetadataModel.fromJson(Map<String, dynamic> json) {
    return ReviewsMetadataModel(
      currentPage: json['currentPage'] as int?,
      numberOfPages: json['numberOfPages'] as int?,
      limit: json['limit'] as int?,
      nextPage: json['nextPage'] as int?,
    );
  }
}

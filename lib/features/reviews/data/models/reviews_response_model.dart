import 'package:route_smart/features/reviews/domain/entites/reviews_response_entity.dart';

import 'review_model.dart';
import 'reviews_metadata_model.dart';

class ReviewsResponseModel extends ReviewsResponseEntity {
  const ReviewsResponseModel({
    super.results,
    super.metadata,
    super.data,
  });

  factory ReviewsResponseModel.fromJson(Map<String, dynamic> json) {
    return ReviewsResponseModel(
      results: json['results'] as int?,
      metadata: json['metadata'] != null
          ? ReviewsMetadataModel.fromJson(json['metadata'])
          : null,
      data: json['data'] != null
          ? (json['data'] as List).map((e) => ReviewModel.fromJson(e)).toList()
          : null,
    );
  }
}

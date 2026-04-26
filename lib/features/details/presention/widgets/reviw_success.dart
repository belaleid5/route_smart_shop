import 'package:flutter/widgets.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/features/details/presention/widgets/empty_state_review.dart';
import 'package:route_smart/features/details/presention/widgets/horizinatoal_list_review.dart';
import 'package:route_smart/features/reviews/data/models/reviews_response_model.dart';

class ReviewsSuccessState extends StatelessWidget {
  const ReviewsSuccessState({
    super.key,
    required this.response,
    required this.colors,
  });

  final ReviewsResponseModel response;
  final MyColors colors;

  static const int previewLimit = 5;
  static const double listHeight = 110.0;
  static const double cardWidth = 250.0;

  @override
  Widget build(BuildContext context) {
    if (response.data.isEmpty) {
      return EmptyStateReview(colors: colors);
    }

    final preview = response.data.take(previewLimit).toList();

    return HorizontalReviewsList(
      reviews: preview,
      colors: colors,
      listHeight: listHeight,
      cardWidth: cardWidth,
    );
  }
}

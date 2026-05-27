import 'package:flutter/widgets.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/smooth_list_view.dart';
import 'package:route_smart/features/details/presention/widgets/review_card.dart';
import 'package:route_smart/features/reviews/data/models/review_model.dart';
import 'package:route_smart/features/reviews/domain/entites/review_entity.dart';

class HorizontalReviewsList extends StatelessWidget {
  const HorizontalReviewsList({
    super.key,
    required this.reviews,
    required this.colors,
    required this.listHeight,
    required this.cardWidth,
  });

  final List<ReviewEntity> reviews;
  final MyColors colors;
  final double listHeight;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listHeight,
      child: SmoothListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: reviews.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, index) => SizedBox(
          width: cardWidth,
          child: ReviewPreviewCard(review: reviews[index], colors: colors),
        ),
        duration: Duration(milliseconds: 500),
      ),
    );
  }
}
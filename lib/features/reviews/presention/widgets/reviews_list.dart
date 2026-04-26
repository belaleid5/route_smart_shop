import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/smooth_list_view.dart';
import 'package:route_smart/features/details/presention/widgets/review_card.dart';

import '../../../../core/app/theme/my_colors.dart';
import '../../data/models/review_model.dart';

class VerticalReviewsList extends StatelessWidget {
  const VerticalReviewsList({
    super.key,
    required this.productId, 
    required this.reviews,
    required this.colors,
    required this.cardWidth,
    required this.currentUserId,
  });

  final String productId; 
  final List<ReviewModel> reviews;
  final MyColors colors;
  final double cardWidth;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return Center(child: Text('No reviews yet.', style: TextStyle(color: colors.textSecondary)));
    }

    return SmoothListView.separated(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: reviews.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final review = reviews[index];
        final isMyReview = currentUserId.isNotEmpty && review.user.id.trim() == currentUserId.trim();

        return Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: cardWidth,
            child: ReviewPreviewCard(
              review: review,
              colors: colors,
              isMyReview: isMyReview,
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 500),
    );
  }
}
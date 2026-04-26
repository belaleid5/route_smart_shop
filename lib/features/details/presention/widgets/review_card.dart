import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/features/details/presention/widgets/user_avatar.dart';
import 'package:route_smart/features/reviews/data/models/review_model.dart';
import 'package:route_smart/features/reviews/presention/widgets/reviews_actions.dart';
import 'package:route_smart/features/reviews/presention/widgets/star_rating_widget.dart';

class ReviewPreviewCard extends StatelessWidget {
  const ReviewPreviewCard({
    super.key,
    required this.review,
    required this.colors,
    this.isMyReview = false,
  });

  final ReviewModel review;
  final MyColors colors;
  final bool isMyReview;

  @override
  Widget build(BuildContext context) {
    final userName = review.user.name;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.divider.withOpacity(0.8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              UserAvatar(name: userName, colors: colors),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colors.textPrimary,
                      ),
                    ),
                    StarRatingWidget(rating: review.rating),
                  ],
                ),
              ),
              if (isMyReview) ReviewActions(review: review),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            review.review,
            style: TextStyle(color: colors.textSecondary),
          ),
        ],
      ),
    );
  }
}
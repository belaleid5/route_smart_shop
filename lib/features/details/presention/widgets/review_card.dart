import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/features/details/presention/widgets/review_action_menu.dart';
import 'package:route_smart/features/details/presention/widgets/user_avatar.dart';
import 'package:route_smart/features/reviews/data/models/review_model.dart';
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
              UserAvatar(name: review.user.name, colors: colors),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.user.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    StarRatingWidget(rating: review.rating.toDouble()),
                  ],
                ),
              ),
              if (isMyReview) ReviewActionsMenu(review: review),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            review.review,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: colors.textSecondary),
          ),
        ],
      ),
    );
  }
}

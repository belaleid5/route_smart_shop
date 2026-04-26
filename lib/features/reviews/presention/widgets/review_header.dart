import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/reviews/presention/widgets/review_avatar.dart';
import 'package:route_smart/features/reviews/presention/widgets/star_rating_widget.dart';

class ReviewHeader extends StatelessWidget {
  const ReviewHeader({
    super.key,
    required this.name,
    required this.rating,
   required this.imageUrl,
  });

  final String name;
  final double rating;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ReviewAvatar(
          imageUrl: imageUrl,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: context.color.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              StarRatingWidget(rating: rating),
            ],
          ),
        ),
      ],
    );
  }
}
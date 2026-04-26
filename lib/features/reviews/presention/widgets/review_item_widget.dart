import 'package:flutter/material.dart';
import 'package:route_smart/features/reviews/presention/widgets/review_comment.dart';
import 'package:route_smart/features/reviews/presention/widgets/review_header.dart';

class ReviewItemWidget extends StatelessWidget {
  const ReviewItemWidget({
    super.key,
    required this.name,
    required this.rating,
    required this.comment,
   required this.imageUrl,
  });

  final String name;
  final double rating;
  final String comment;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewHeader(
            name: name,
            rating: rating,
            imageUrl: imageUrl,
          ),
          const SizedBox(height: 8),
          ReviewComment(comment: comment),
        ],
      ),
    );
  }
}
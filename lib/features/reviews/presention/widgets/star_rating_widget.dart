import 'package:flutter/material.dart';

class StarRatingWidget extends StatelessWidget {
  const StarRatingWidget({
    super.key,
    required this.rating,
    this.maxStars = 5,
  });

  final num rating;
  final int maxStars;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxStars, (index) {
        final starValue = index + 1;
        final IconData iconData;

        if (starValue <= rating) {
          iconData = Icons.star_rounded;           
        } else if (starValue - 0.5 <= rating) {
          iconData = Icons.star_half_rounded;      
        } else {
          iconData = Icons.star_outline_rounded;   
        }

        return Icon(
          iconData,
          color: const Color(0xFFF5A623),
          size: 22,
        );
      }),
    );
  }
}
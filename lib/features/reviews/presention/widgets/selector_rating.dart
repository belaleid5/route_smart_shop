import 'package:flutter/material.dart';

class StarSelector extends StatelessWidget {
  final double rating;
  final ValueChanged<double> onRatingChanged;

  const StarSelector({
    super.key,
    required this.rating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, 
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () => onRatingChanged((index + 1).toDouble()),
          child: Icon(
            index < rating ? Icons.star_rounded : Icons.star_outline_rounded,
            color: const Color(0xFFF5A623),
            size: 36,
          ),
        );
      }),
    );
  }
}
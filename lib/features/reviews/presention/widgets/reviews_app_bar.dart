import 'package:flutter/material.dart';

class ReviewsAppBar extends StatelessWidget {
  const ReviewsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 24, 20, 16),
        child: Text(
          'Reviews',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ReviewComment extends StatelessWidget {
  const ReviewComment({super.key, required this.comment});

  final String comment;

  @override
  Widget build(BuildContext context) {
    return Text(
      comment,
      style: TextStyle(
        fontSize: 14,
        height: 1.6,
        color: Colors.grey.shade700,
      ),
    );
  }
}

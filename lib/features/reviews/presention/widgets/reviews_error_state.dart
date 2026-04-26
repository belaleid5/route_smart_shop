import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/reviews/presention/manger/review_events.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_bloc.dart';

class ReviewsErrorStateScreen extends StatelessWidget {
  const ReviewsErrorStateScreen({
    super.key,
    required this.message,
    required this.productId,
  });

  final String message;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.textStyle.copyWith(color: context.color.primary),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<ReviewsBloc>().add(
                ReviewsEvent.getProductReviews(productId: productId),
              ),
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}

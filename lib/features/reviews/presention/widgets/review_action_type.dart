import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/features/reviews/data/models/review_model.dart';
import 'package:route_smart/features/reviews/presention/manger/review_events.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_bloc.dart';
import 'package:route_smart/features/reviews/presention/widgets/add_fab_review.dart';

enum ReviewActionType { edit, delete }

class ReviewActions extends StatelessWidget {
  const ReviewActions({super.key, required this.review});

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ReviewActionType>(
      onSelected: (value) async {
        switch (value) {
          case ReviewActionType.edit:
            _openEditBottomSheet(context);
            break;

          case ReviewActionType.delete:
            final confirmed = await _confirmDelete(context);
            if (confirmed == true && context.mounted) {
              context.read<ReviewsBloc>().add(
                    ReviewsEvent.deleteReview(
                      productId: review.product,
                      reviewId: review.id,
                    ),
                  );
            }
            break;
        }
      },
      itemBuilder: (_) => const [
        PopupMenuItem(
          value: ReviewActionType.edit,
          child: Text('Edit'),
        ),
        PopupMenuItem(
          value: ReviewActionType.delete,
          child: Text('Delete'),
        ),
      ],
    );
  }

  void _openEditBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<ReviewsBloc>(),
        child: AddReviewBottomSheet(
          productId: review.product,
          existingReview: review,
        ),
      ),
    );
  }

  Future<bool?> _confirmDelete(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Review'),
        content: const Text('Are you sure you want to delete your review?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
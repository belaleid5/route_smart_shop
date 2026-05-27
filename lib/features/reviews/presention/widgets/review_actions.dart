import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/features/reviews/domain/entites/review_entity.dart';
import 'package:route_smart/features/reviews/presention/manger/review_events.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_bloc.dart';
import 'package:route_smart/features/reviews/presention/widgets/add_review_bottom_sheet.dart';

enum ReviewActionType { edit, delete }

class ReviewActions extends StatelessWidget {
  const ReviewActions({super.key, required this.review});

  final ReviewEntity review;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ReviewActionType>(
      icon: const Icon(Icons.more_vert, size: 20),
      onSelected: (value) async {
        switch (value) {
          case ReviewActionType.edit:
            _openEditBottomSheet(context);
            break;

          case ReviewActionType.delete:
            final confirmed = await _confirmDelete(context);
            if (confirmed == true &&
                context.mounted &&
                review.id != null &&
                review.product != null) {
              context.read<ReviewsBloc>().add(
                    ReviewDeleteRequested(
                      productId: review.product!,
                      reviewId: review.id!,
                    ),
                  );
            }
            break;
        }
      },
      itemBuilder: (_) => const [
        PopupMenuItem(
          value: ReviewActionType.edit,
          child: Row(
            children: [
              Icon(Icons.edit, size: 18),
              SizedBox(width: 8),
              Text('Edit'),
            ],
          ),
        ),
        PopupMenuItem(
          value: ReviewActionType.delete,
          child: Row(
            children: [
              Icon(Icons.delete, size: 18, color: Colors.red),
              SizedBox(width: 8),
              Text('Delete', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ],
    );
  }

  void _openEditBottomSheet(BuildContext context) {
    if (review.product == null) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<ReviewsBloc>(),
        child: AddReviewBottomSheet(
          productId: review.product!,
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
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

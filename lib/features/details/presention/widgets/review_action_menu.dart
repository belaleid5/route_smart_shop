// features/reviews/presentation/widgets/review_actions_menu.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/features/reviews/data/models/review_model.dart';
import 'package:route_smart/features/reviews/domain/entites/review_entity.dart';
import 'package:route_smart/features/reviews/presention/manger/review_events.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_bloc.dart';
import 'package:route_smart/features/reviews/presention/widgets/add_fab_review.dart';
import 'package:route_smart/features/reviews/presention/widgets/add_review_bottom_sheet.dart';

class ReviewActionsMenu extends StatelessWidget {
  final ReviewEntity review;
  
  const ReviewActionsMenu({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) => _handleAction(context, value),
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'edit', child: Text('Edit')),
        const PopupMenuItem(
          value: 'delete',
          child: Text('Delete', style: TextStyle(color: Colors.red)),
        ),
      ],
      icon: const Icon(Icons.more_vert, size: 20),
    );
  }

  void _handleAction(BuildContext context, String action) {
    if (action == 'edit') {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) => BlocProvider.value(
          value: context.read<ReviewsBloc>(),
          child: AddReviewBottomSheet(
            productId: review.product!,
            existingReview: review,
          ),
        ),
      );
    } else if (action == 'delete') {
      _showDeleteDialog(context);
    }
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Review'),
        content: const Text('Are you sure you want to delete this review?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<ReviewsBloc>().add(
                ReviewDeleteRequested(
                  productId: review.product!,
                  reviewId: review.id!,
                ),
              );
              Navigator.pop(ctx);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
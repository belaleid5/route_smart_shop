import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_bloc.dart';
import 'package:route_smart/features/reviews/presention/widgets/add_fab_review.dart';
import 'package:route_smart/features/reviews/presention/widgets/review_view.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reviews')),
      body: ReviewsView(productId: productId),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddReviewSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddReviewSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<ReviewsBloc>(),
        child: AddReviewBottomSheet(productId: productId),
      ),
    );
  }
}
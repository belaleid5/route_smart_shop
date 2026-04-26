import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/features/details/presention/widgets/error_state_review.dart';
import 'package:route_smart/features/details/presention/widgets/loading_state_review.dart';
import 'package:route_smart/features/details/presention/widgets/review_header.dart';
import 'package:route_smart/features/details/presention/widgets/reviw_success.dart';
import 'package:route_smart/features/reviews/presention/manger/review_events.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_bloc.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_state.dart';

class ReviewsPreviewSection extends StatelessWidget {
  const ReviewsPreviewSection({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocConsumer<ReviewsBloc, ReviewsState>(
      listenWhen: (_, current) => current.maybeWhen(
        reviewCreated: () => true,
        reviewDeleted: () => true,
        actionError: (_) => true,
        orElse: () => false,
      ),
      listener: (context, state) {
        state.maybeWhen(
          reviewCreated: () {
            context.read<ReviewsBloc>().add(
              ReviewsEvent.getProductReviews(productId: productId),
            );
          },
          reviewDeleted: () {
            context.read<ReviewsBloc>().add(
              ReviewsEvent.getProductReviews(productId: productId),
            );
          },
          actionError: (message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return ColoredBox(
          color: colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ReviewsHeader(
                  totalReviews: state.maybeWhen(
                    success: (response) => response.results,
                    orElse: () => 0,
                  ),
                  productId: productId,
                  colors: colors,
                ),
                const SizedBox(height: 12),

                state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => LoadingStateReview(colors: colors),
                  success: (response) =>
                      ReviewsSuccessState(colors: colors, response: response),
                  error: (message) => ErrorStateReview(
                    colors: colors,
                    onRetry: () => context.read<ReviewsBloc>().add(
                      ReviewsEvent.getProductReviews(productId: productId),
                    ),
                  ),
                  actionLoading: () => LoadingStateReview(colors: colors),
                  reviewCreated: () => LoadingStateReview(colors: colors),
                  reviewUpdated: () => LoadingStateReview(colors: colors),
                  reviewDeleted: () => LoadingStateReview(colors: colors),
                  actionError: (_) => ErrorStateReview(
                    colors: colors,
                    onRetry: () => context.read<ReviewsBloc>().add(
                      ReviewsEvent.getProductReviews(productId: productId),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

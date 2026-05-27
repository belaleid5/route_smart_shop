import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_state.dart';
import 'package:route_smart/features/reviews/presention/widgets/review_shimmer_loading.dart';
import 'package:route_smart/features/reviews/presention/widgets/reviews_error_state.dart';
import 'package:route_smart/features/reviews/presention/widgets/vertical_reviews_list.dart';

class ReviewsBuilder {
  static Widget build(
    BuildContext context,
    ReviewsState state,
    String productId,
    Future<String?> userIdFuture,
  ) {
    return switch (state) {
      ReviewsInitial() => const SizedBox.shrink(),

      ReviewsInProgress() => const ReviewsLoadingShimmer(),

      ReviewsSuccess(:final response) => FutureBuilder<String?>(
          future: userIdFuture,
          builder: (context, snapshot) {
            final size = MediaQuery.sizeOf(context);
            final reviews = response.data ?? [];
            final currentUserId = snapshot.data?.trim() ?? '';

            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: VerticalReviewsList(
                      productId: productId,
                      reviews: reviews,
                      colors: context.colors,
                      cardWidth: size.width - 32,
                      currentUserId: currentUserId,
                    ),
                  ),
                ),
              ],
            );
          },
        ),

      ReviewsFailure(:final message) => ReviewsErrorStateScreen(
          message: message,
          productId: productId,
        ),

      _ => const SizedBox.shrink(),
    };
  }
}

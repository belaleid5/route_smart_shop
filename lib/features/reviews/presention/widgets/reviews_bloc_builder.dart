// features/reviews/presention/widgets/reviews_bloc_builder.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_state.dart';
import 'package:route_smart/features/reviews/presention/widgets/review_shimmer_loading.dart';
import 'package:route_smart/features/reviews/presention/widgets/reviews_app_bar.dart';
import 'package:route_smart/features/reviews/presention/widgets/reviews_error_state.dart';
import 'package:route_smart/features/reviews/presention/widgets/reviews_list.dart';

class ReviewsListener {
  static void handle(BuildContext context, ReviewsState state) {
    state.maybeWhen(
      reviewCreated: () {
        _popIfPossible(context);
        CustomToast.showSuccess(context, 'Review added successfully');
      },
      
      reviewUpdated: () {
        _popIfPossible(context);
        CustomToast.showSuccess(context, 'Review updated successfully');
      },

      actionError: (message) {
        _popIfPossible(context); 
        CustomToast.showError(context, context.translate(LangKeys.reviewAlreadyAdded));
      },

      reviewDeleted: () {
        CustomToast.showSuccess(context, 'Review deleted successfully');
      },
      
      orElse: () {},
    );
  }

  static void _popIfPossible(BuildContext context) {
    final route = ModalRoute.of(context);
    if (route?.isCurrent == false && Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}

class ReviewsBuilder {
  static Widget build(
    BuildContext context,
    ReviewsState state,
    String productId,
    Future<String?> userIdFuture,
  ) {
    return state.maybeWhen(
      initial: () => const SizedBox.shrink(),
      
      loading: () => const ReviewsLoadingShimmer(),

      success: (response) => FutureBuilder<String?>(
        future: userIdFuture,
        builder: (context, snapshot) {
          final size = MediaQuery.sizeOf(context);
          final reviews = response.data;
          final currentUserId = snapshot.data?.trim() ?? '';

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const ReviewsAppBar(),
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
                    colors: context.color,
                    cardWidth: size.width - 32,
                    currentUserId: currentUserId,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      error: (message) => ReviewsErrorStateScreen(
        message: message, 
        productId: productId,
      ),

     
      orElse: () => const SizedBox.shrink(),
    );
  }
}
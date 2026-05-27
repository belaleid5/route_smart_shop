import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/details/presention/widgets/error_state_review.dart';
import 'package:route_smart/features/details/presention/widgets/loading_state_review.dart';
import 'package:route_smart/features/details/presention/widgets/review_header.dart';
import 'package:route_smart/features/details/presention/widgets/reviw_success.dart';
import 'package:route_smart/features/reviews/presention/manger/review_events.dart'; // مسار الـ Event
import 'package:route_smart/features/reviews/presention/manger/reviews_bloc.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_state.dart';

class ReviewsPreviewSection extends StatelessWidget {
  const ReviewsPreviewSection({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocConsumer<ReviewsBloc, ReviewsState>(
      listenWhen: (_, current) =>
          current is ReviewCreated ||
          current is ReviewDeleted ||
          current is ReviewActionFailure, 
      listener: (context, state) {
        if (state is ReviewCreated || state is ReviewDeleted) {
          context.read<ReviewsBloc>().add(ProductReviewsRequested(productId)); // ✅ استدعاء الكلاس مباشرة
        } else if (state is ReviewActionFailure) {
          CustomToast.showError(context, state.message);
        }
      },
      builder: (context, state) {
        return ColoredBox(
          color: colors.background,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ReviewsHeader(
                  totalReviews: state is ReviewsSuccess
                      ? state.response.results ?? 0
                      : 0,
                  productId: productId,
                  colors: colors,
                ),
                verticalSpace(12),
                
                switch (state) {
                  ReviewsInitial() => const SizedBox.shrink(),
                  
                  ReviewsSuccess(:final response) => ReviewsSuccessState(
                    colors: colors,
                    response: response,
                  ),
                  
                  ReviewsFailure() || ReviewActionFailure() => ErrorStateReview(
                    colors: colors,
                    onRetry: () => context.read<ReviewsBloc>().add(
                      ProductReviewsRequested(productId),
                    ),
                  ),
                  
                  _ => LoadingStateReview(colors: colors),
                },
              ],
            ),
          ),
        );
      },
    );
  }
}
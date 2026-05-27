import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_bloc.dart';
import 'package:route_smart/features/reviews/presention/widgets/add_review_bottom_sheet.dart';
import 'package:route_smart/features/reviews/presention/widgets/review_view.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          LangKeys.review,
          style: context.textStyle.copyWith(
            fontSize: 30,
            fontWeight: FontWeightHelper.semiBold,
            color: colors.textPrimary,
          ),
        ),
      ),
      body: ReviewsView(productId: productId),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddReviewSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddReviewSheet(BuildContext context) {
    final colors = context.colors;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.background,

      builder: (_) => BlocProvider.value(
        value: context.read<ReviewsBloc>(),
        child: AddReviewBottomSheet(productId: productId),
      ),
    );
  }
}

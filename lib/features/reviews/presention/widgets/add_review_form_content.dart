import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/reviews/presention/widgets/add_review_submit_button.dart';
import 'package:route_smart/features/reviews/presention/widgets/selector_rating.dart';

class AddReviewFormContent extends StatelessWidget {
  final bool isEditing;
  final double rating;
  final TextEditingController reviewController;
  final ValueChanged<double> onRatingChanged;
  final VoidCallback onSubmit;

  const AddReviewFormContent({
    super.key,
    required this.isEditing,
    required this.rating,
    required this.reviewController,
    required this.onRatingChanged,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        left: 20,
        right: 20,
        top: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: context.colors.divider.withOpacity(0.5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          Text(
            isEditing
                ? context.translate(LangKeys.edit)
                : context.translate(LangKeys.review),
            style: context.textStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: context.colors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),

          Center(
            child: StarSelector(
              rating: rating,
              onRatingChanged: onRatingChanged,
            ),
          ),
          const SizedBox(height: 16),

          TextField(
            controller: reviewController,
            maxLines: 4,
            style: context.textStyle.copyWith(fontSize: 14),
            decoration: InputDecoration(
              hintText: context.translate('write_your_review'),
              hintStyle: TextStyle(color: context.colors.textSecondary),
              filled: true,
              fillColor: context.colors.textSecondary.withOpacity(0.05),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: context.colors.button),
              ),
            ),
          ),
          const SizedBox(height: 24),

          AddReviewSubmitButton(
            isEditing: isEditing,
            onSubmit: onSubmit,
            isDisabled: rating == 0,
          ),
        ],
      ),
    );
  }
}

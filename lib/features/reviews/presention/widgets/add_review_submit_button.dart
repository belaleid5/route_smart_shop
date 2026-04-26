import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/widgets/loading_widget.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_bloc.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_state.dart';

class AddReviewSubmitButton extends StatelessWidget {
  final bool isEditing;
  final VoidCallback onSubmit;
  final bool isDisabled; 

  const AddReviewSubmitButton({
    super.key,
    required this.isEditing,
    required this.onSubmit,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsBloc, ReviewsState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          actionLoading: () => true,
          orElse: () => false,
        );

        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: (isLoading || isDisabled) ? null : onSubmit,
            style: ElevatedButton.styleFrom(
              backgroundColor: context.color.button,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: isLoading
                ? const LoadingWidget()
                : Text(
                    isEditing
                        ? context.translate(LangKeys.updateReview)
                        : context.translate(LangKeys.submitReview),
                    style: context.textStyle.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
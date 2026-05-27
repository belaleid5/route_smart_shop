import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/features/reviews/domain/entites/review_entity.dart'; // ✅ تم التعديل
import 'package:route_smart/features/reviews/presention/manger/review_events.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_bloc.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_state.dart';
import 'package:route_smart/features/reviews/presention/widgets/selector_rating.dart';

class AddReviewBottomSheet extends StatefulWidget {
  const AddReviewBottomSheet({
    super.key,
    required this.productId,
    this.existingReview,
  });

  final String productId;
  final ReviewEntity? existingReview; // ✅ تم التعديل

  bool get isEditMode => existingReview != null;

  @override
  State<AddReviewBottomSheet> createState() => _AddReviewBottomSheetState();
}

class _AddReviewBottomSheetState extends State<AddReviewBottomSheet> {
  late final TextEditingController _reviewController;
  double _rating = 0;

  @override
  void initState() {
    super.initState();
    _reviewController = TextEditingController(
      text: widget.existingReview?.review ?? '',
    );
    _rating = (widget.existingReview?.rating ?? 0).toDouble();
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: context.colors.background,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Text(
              widget.isEditMode ? 'Edit Your Review' : 'Add Your Review',
              style: context.textStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: StarSelector(
                rating: _rating,
                onRatingChanged: (value) => setState(() => _rating = value),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _reviewController,
              maxLines: 3,
              style: context.textStyle.copyWith(fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Share your experience...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: context.colors.button,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: BlocBuilder<ReviewsBloc, ReviewsState>(
                builder: (context, state) {
                  // ✅ تم التعديل: استخدام Pure Dart
                  final isLoading = state is ReviewActionInProgress; 

                  return ElevatedButton(
                    onPressed: (isLoading || _rating == 0) ? null : _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colors.button,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            widget.isEditMode ? 'Update' : 'Submit',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    final reviewText = _reviewController.text.trim();
    if (widget.isEditMode) {
      context.read<ReviewsBloc>().add(
        ReviewUpdateRequested( 
          productId: widget.productId,
          reviewId: widget.existingReview!.id!,
          reviewText: reviewText,
          rating: _rating,
        ),
      );
    } else {
      context.read<ReviewsBloc>().add(
        ReviewCreateRequested( 
          productId: widget.productId,
          reviewText: reviewText,
          rating: _rating,
        ),
      );
    }
  }
}
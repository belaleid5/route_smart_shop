import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/reviews/data/models/review_model.dart';
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
  final ReviewModel? existingReview;

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
          color: context.color.background,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
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

            StarSelector(
              rating: _rating,
              onRatingChanged: (value) => setState(() => _rating = value),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _reviewController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Share your experience...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: BlocBuilder<ReviewsBloc, ReviewsState>(
                builder: (context, state) {
                  final isLoading = state.maybeWhen(
                    actionLoading: () => true,
                    orElse: () => false,
                  );

                  return ElevatedButton(
                    onPressed: (isLoading || _rating == 0) ? null : _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.color.button,
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
                            style: const TextStyle(color: Colors.white),
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
            ReviewsEvent.updateReview(
              productId: widget.productId,
              reviewId: widget.existingReview!.id,
              review: reviewText,
              rating: _rating,
            ),
          );
    } else {
      context.read<ReviewsBloc>().add(
            ReviewsEvent.createReview(
              productId: widget.productId,
              review: reviewText,
              rating: _rating,
            ),
          );
    }
  }
}
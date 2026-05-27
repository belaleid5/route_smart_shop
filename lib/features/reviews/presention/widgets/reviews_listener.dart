import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/extensions/custom_toast.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/reviews/presention/manger/reviews_state.dart';

class ReviewsListener {
  static void handle(BuildContext context, ReviewsState state) {
    switch (state) {
      case ReviewCreated():
        _popIfPossible(context);
        CustomToast.showSuccess(context, 'Review added successfully');

      case ReviewUpdated():
        _popIfPossible(context);
        CustomToast.showSuccess(context, 'Review updated successfully');

      case ReviewActionFailure(:final message):
        _popIfPossible(context);
        CustomToast.showError(
            context, context.translate(LangKeys.reviewAlreadyAdded));

      case ReviewDeleted():
        CustomToast.showSuccess(context, 'Review deleted successfully');

      default:
        break;
    }
  }

  static void _popIfPossible(BuildContext context) {
    final route = ModalRoute.of(context);
    if (route?.isCurrent == false && Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}

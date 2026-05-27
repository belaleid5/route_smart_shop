import 'package:flutter/material.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/search/presention/widgets/search_error_message.dart';
import 'package:route_smart/features/search/presention/widgets/search_retry_button.dart';

class SearchErrorView extends StatelessWidget {
  const SearchErrorView({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchErrorMessage(message: message),
          verticalSpace(16),
          const SearchRetryButton(),
        ],
      ),
    );
  }
}

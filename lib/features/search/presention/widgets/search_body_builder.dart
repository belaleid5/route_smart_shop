// lib/features/search/presentation/widgets/search_body_builder.dart

import 'package:flutter/material.dart';
import 'package:route_smart/features/search/presention/manger/search_state.dart';
import 'package:route_smart/features/search/presention/widgets/search_loading_view.dart';
import 'search_error_view.dart';
import 'search_success_body.dart';

class SearchBodyBuilder extends StatelessWidget {
  const SearchBodyBuilder({
    super.key,
    required this.state,
    required this.scrollController,
  });

  final SearchState state;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    if (state is SearchInitial || state is SearchLoading) {
      return const SearchLoadingView();
    }

    if (state is SearchError) {
      return SearchErrorView(
        message: (state as SearchError).message,
      );
    }

    if (state is SearchSuccess) {
      return SearchSuccessBody(
        state: state as SearchSuccess,
        scrollController: scrollController,
      );
    }

    return const SizedBox.shrink();
  }
}
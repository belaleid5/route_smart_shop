import 'package:flutter/material.dart';
import 'package:route_smart/features/search/presention/manger/search_state.dart';
import 'package:route_smart/features/search/presention/widgets/search_loading_view.dart';
import 'package:route_smart/features/search/presention/widgets/search_error_view.dart';
import 'package:route_smart/features/search/presention/widgets/search_success_body.dart';

class SearchBodyBuilder extends StatelessWidget {
  const SearchBodyBuilder({
    super.key,
    required this.state,
    required this.scrollController,
    required this.keyword,
  });

  final SearchState state;
  final ScrollController scrollController;
  final String keyword;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.03),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
      child: switch (state) {
        SearchInitial() || SearchLoading() => const SearchLoadingView(
            key: ValueKey('loading'),
          ),
        SearchError(:final message) => SearchErrorView(
            key: const ValueKey('error'),
            message: message,
          ),
        SearchSuccess() => SearchSuccessBody(
            key: const ValueKey('success'),
            state: state as SearchSuccess,
            scrollController: scrollController,
            keyword: keyword,
          ),
      },
    );
  }
}
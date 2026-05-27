import 'package:flutter/material.dart';
import 'package:route_smart/features/search/presention/manger/search_state.dart';
import 'package:route_smart/features/search/presention/widgets/search_error_view.dart';
import 'package:route_smart/features/search/presention/widgets/search_loading_view.dart';
import 'package:route_smart/features/search/presention/widgets/search_success_body.dart';
 
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
   
    return switch (state) {
      SearchInitial() || SearchLoading() => const SearchLoadingView(),
 
      SearchError(:final message) => SearchErrorView(message: message),
 
      SearchSuccess successState => SearchSuccessBody(
          key: const ValueKey('success'),
          state: successState,
          scrollController: scrollController,
        ),
    };
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/features/search/presention/manger/search_bloc.dart';
import 'package:route_smart/features/search/presention/manger/search_event.dart';
import 'package:route_smart/features/search/presention/manger/search_state.dart';
import 'package:route_smart/features/search/presention/widgets/search_results_tabs.dart';

class SearchSuccessBody extends StatelessWidget {
  const SearchSuccessBody({
    super.key,
    required this.state,
    required this.scrollController,
  });

  final SearchSuccess state;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SearchResultsTabs(
      state: state,
      scrollController: scrollController,
      onTabChanged: (tab) {
        context.read<SearchBloc>().add(SearchEventTabChanged(tab: tab));
      },
    );
  }
}
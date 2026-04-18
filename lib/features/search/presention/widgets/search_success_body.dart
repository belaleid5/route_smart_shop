import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/features/search/presention/manger/search_bloc.dart';
import 'package:route_smart/features/search/presention/manger/search_event.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';
import 'package:route_smart/features/search/presention/manger/search_state.dart';
import 'package:route_smart/features/search/presention/widgets/search_results_tabs.dart';

class SearchSuccessBody extends StatelessWidget {
  const SearchSuccessBody({
    super.key,
    required this.state,
    required this.scrollController,
    required this.keyword,
  });

  final SearchSuccess state;
  final ScrollController scrollController;
  final String keyword;

  void _onTabChanged(BuildContext context, SearchTab tab) {
    context.read<SearchBloc>().add(SearchEvent.tabChanged(tab: tab));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: SearchResultsTabs(
            state: state,
            scrollController: scrollController,
            keyword: keyword,
            onTabChanged: (tab) => _onTabChanged(context, tab),
          ),
        ),
      ],
    );
  }
}
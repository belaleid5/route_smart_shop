import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/common/widgets/search/search_app_bar.dart';
import 'package:route_smart/features/search/presention/manger/search_bloc.dart';
import 'package:route_smart/features/search/presention/manger/search_event.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';
import 'package:route_smart/features/search/presention/manger/search_state.dart';
import 'package:route_smart/features/search/presention/widgets/search_body_builder.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => SearchBodyState();
}

class SearchBodyState extends State<SearchBody> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _triggerInitialSearch();
  }

  @override
  void dispose() {
    context.read<SearchBloc>().stopAutoFetch();
    _searchController.dispose();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _triggerInitialSearch() {
    context.read<SearchBloc>().add(
      const SearchEvent.search(
        params: SearchFilterParams(page: 1, limit: 20),
      ),
    );
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    final isNearBottom = position.pixels >= position.maxScrollExtent - 300;
    if (isNearBottom) {
      context.read<SearchBloc>().add(const SearchEvent.loadNextPage());
    }
  }

  void _onKeywordChanged(String keyword) {
    context.read<SearchBloc>().add(
      SearchEvent.keywordChanged(keyword: keyword),
    );
  }

  void _onCategorySelected(String? categoryId) {
    context.read<SearchBloc>().add(
      SearchEvent.categorySelected(categoryId: categoryId),
    );
  }

  void _onCleared() {
    _searchController.clear();
    context.read<SearchBloc>().add(const SearchEvent.cleared());
  }

  void _onParamsChanged(SearchFilterParams params) {
    context.read<SearchBloc>().add(
      SearchEvent.search(params: params),
    );
  }

  List<CategoryData> _getCategories(SearchState state) =>
      state is SearchSuccess ? state.categories : [];

  String? _getSelectedCategoryId(SearchState state) =>
      state is SearchSuccess ? state.params.categoryId : null;

  SearchFilterParams _getCurrentParams(SearchState state) =>
      state is SearchSuccess ? state.params : const SearchFilterParams();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchAppBar(
                controller: _searchController,
                onSearch: _onKeywordChanged,
                onChanged: _onKeywordChanged,
                categories: _getCategories(state),
                selectedCategoryId: _getSelectedCategoryId(state),
                onCategorySelected: _onCategorySelected,
                params: _getCurrentParams(state),
                onParamsChanged: _onParamsChanged,
                onCleared: _onCleared,
              ),

              // ── Body ─────────────────────────────────────────────────────
              Expanded(
                child: SearchBodyBuilder(
                  state: state,
                  scrollController: _scrollController,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
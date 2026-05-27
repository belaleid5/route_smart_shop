import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/core/common/widgets/search/search_app_bar.dart';
import 'package:route_smart/features/search/domain/entites/search_params.dart';
import 'package:route_smart/features/search/presention/manger/search_bloc.dart';
import 'package:route_smart/features/search/presention/manger/search_event.dart';
import 'package:route_smart/features/search/presention/manger/search_state.dart';
import 'package:route_smart/features/search/presention/widgets/search_body_builder.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key, this.showBackButton = false});

  final bool showBackButton;

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  late final TextEditingController _searchController;
  late final ScrollController _scrollController;
  Timer? _autoLoadTimer;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _scrollController = ScrollController()..addListener(_onScroll);
    _triggerInitialSearch();
    _startAutoAddProducts(); 
  }

  @override
  void dispose() {
    _autoLoadTimer?.cancel();
    _searchController.dispose();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _startAutoAddProducts() {
    _autoLoadTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      context.read<SearchBloc>().add(const SearchEventLoadNextPage());

    });
  }

  void _triggerInitialSearch() {
    context.read<SearchBloc>().add(
      const SearchEventSearch(params: SearchFilterParams(page: 1, limit: 20)),
    );
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    final isNearBottom = position.pixels >= position.maxScrollExtent - 300;

    if (isNearBottom && !position.outOfRange) {
      context.read<SearchBloc>().add(const SearchEventLoadNextPage());
    }
  }

  void _onKeywordChanged(String keyword) {
    context.read<SearchBloc>().add(SearchEventKeywordChanged(keyword: keyword));
  }

  void _onCategorySelected(String? categoryId) {
    context.read<SearchBloc>().add(
      SearchEventCategorySelected(categoryId: categoryId),
    );
  }

  void _onCleared() {
    _searchController.clear();
    context.read<SearchBloc>().add(const SearchEventCleared());
  }

  void _onParamsChanged(SearchFilterParams params) {
    context.read<SearchBloc>().add(SearchEventSearch(params: params));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        List<CategoryEntity> categories = state is SearchSuccess
            ? state.categories
            : [];
        final selectedCategoryId = state is SearchSuccess
            ? state.params.categoryId
            : null;
        final currentParams = state is SearchSuccess
            ? state.params
            : const SearchFilterParams();

        return CustomScrollView(
          controller: _scrollController,
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              automaticallyImplyLeading: false,
              backgroundColor: context.colors.background,
              elevation: 1,
              expandedHeight: widget.showBackButton ? 175 : 160,
              flexibleSpace: SearchAppBar(
                controller: _searchController,
                onSearch: _onKeywordChanged,
                onChanged: _onKeywordChanged,
                categories: categories,
                selectedCategoryId: selectedCategoryId,
                onCategorySelected: _onCategorySelected,
                params: currentParams,
                onParamsChanged: _onParamsChanged,
                onCleared: _onCleared,
                showBackButton: widget.showBackButton,
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: true,
              child: SearchBodyBuilder(
                state: state,
                scrollController: _scrollController,
              ),
            ),
          ],
        );
      },
    );
  }
}

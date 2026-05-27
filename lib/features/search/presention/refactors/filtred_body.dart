import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/features/search/domain/entites/search_params.dart';
import 'package:route_smart/features/search/presention/manger/search_bloc.dart';
import 'package:route_smart/features/search/presention/manger/search_event.dart';
import 'package:route_smart/features/search/presention/manger/search_state.dart';
import 'package:route_smart/features/search/presention/widgets/filtred_app_bar.dart';
import 'package:route_smart/features/search/presention/widgets/search_body_builder.dart';

class FilteredProductsBody extends StatefulWidget {
  const FilteredProductsBody({
    super.key,
    required this.title,
    this.categoryId,
    this.brandId,
  });

  final String title;
  final String? categoryId;
  final String? brandId;

  @override
  State<FilteredProductsBody> createState() => _FilteredProductsBodyState();
}

class _FilteredProductsBodyState extends State<FilteredProductsBody> {
  late final ScrollController _scrollController;
  late final SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = context.read<SearchBloc>();
    _scrollController = ScrollController()..addListener(_onScroll);

    if (widget.categoryId != null || widget.brandId != null) {
      _searchBloc.add(
        SearchEventSearch(
          params: SearchFilterParams(
            categoryId: widget.categoryId,
            brandId: widget.brandId,
            page: 1,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final state = _searchBloc.state;
    if (state is! SearchSuccess) return;
    if (state.hasReachedMax || state.isLoadingMore) return;

    final position = _scrollController.position;
    final isNearBottom = position.pixels >= position.maxScrollExtent - 300;

    if (isNearBottom) {
      _searchBloc.add(const SearchEventLoadNextPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          FilteredAppBar(title: widget.title),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) => SearchBodyBuilder(
                state: state,
                scrollController: _scrollController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
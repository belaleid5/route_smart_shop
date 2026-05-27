// features/search/presentation/manager/search_event.dart

import 'package:route_smart/features/search/domain/entites/search_params.dart';

sealed class SearchEvent {
  const SearchEvent();
}

final class SearchEventSearch extends SearchEvent {
  const SearchEventSearch({this.params});
  final SearchFilterParams? params;
}

final class SearchEventLoadNextPage extends SearchEvent {
  const SearchEventLoadNextPage();
}

final class SearchEventCategorySelected extends SearchEvent {
  const SearchEventCategorySelected({required this.categoryId});
  final String? categoryId;
}

final class SearchEventSortChanged extends SearchEvent {
  const SearchEventSortChanged({required this.sort});
  final String? sort;
}

final class SearchEventCleared extends SearchEvent {
  const SearchEventCleared();
}

final class SearchEventTabChanged extends SearchEvent {
  const SearchEventTabChanged({required this.tab});
  final SearchTab tab;
}

final class SearchEventKeywordChanged extends SearchEvent {
  const SearchEventKeywordChanged({required this.keyword});
  final String keyword;
}
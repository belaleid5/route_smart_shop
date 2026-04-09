import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';

part 'search_event.freezed.dart';

// search_event.dart

// search_event.dart

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.search({
    SearchFilterParams? params,
  }) = SearchEventSearch;

  const factory SearchEvent.loadNextPage()    = SearchEventLoadNextPage;
  const factory SearchEvent.autoFetch()       = SearchEventAutoFetch; // ✅ جديد

  const factory SearchEvent.categorySelected({
    required String? categoryId,
  }) = SearchEventCategorySelected;

  const factory SearchEvent.sortChanged({
    required String? sort,
  }) = SearchEventSortChanged;

  const factory SearchEvent.cleared()         = SearchEventCleared;

  const factory SearchEvent.tabChanged({
    required SearchTab tab,
  }) = SearchEventTabChanged;

  const factory SearchEvent.keywordChanged({
    required String keyword,
  }) = SearchEventKeywordChanged;
}
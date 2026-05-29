import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/domain/entites/brand_entity.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/core/common/domain/entites/product_entity.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/search/domain/entites/search_params.dart';
import 'package:route_smart/features/search/domain/repo/search_category_repo.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required SearchCatalogRepository searchCatalogRepository,
  })  : repo = searchCatalogRepository,
        super(const SearchInitial()) {
    on<SearchEventSearch>(onSearch);
    on<SearchEventLoadNextPage>(onLoadNextPage);
    on<SearchEventCategorySelected>(onCategorySelected);
    on<SearchEventSortChanged>(onSortChanged);
    on<SearchEventCleared>(onCleared);
    on<SearchEventTabChanged>(onTabChanged);
    on<SearchEventKeywordChanged>(onKeywordChanged);
  }

  final SearchCatalogRepository repo;

  final List<ProductEntity> allProducts = [];
  final List<BrandEntity> allBrands = [];
  final List<CategoryEntity> allCategories = [];

  SearchFilterParams get currentParams => switch (state) {
        SearchSuccess(params: final p) => p,
        _ => const SearchFilterParams(),
      };

  SearchSuccess currentSuccessOrEmpty() => switch (state) {
        SearchSuccess() => state as SearchSuccess,
        _ => const SearchSuccess(
            params: SearchFilterParams(),
            products: [],
            categories: [],
            brands: [],
          ),
      };

  Future<void> onSearch(
    SearchEventSearch event,
    Emitter<SearchState> emit,
  ) async {
    final params = event.params ?? const SearchFilterParams();
    clearAll();
    emit(const SearchLoading());
    await Future.wait([
      fetchProducts(emit: emit, params: params),
      fetchBrands(emit: emit, params: params),
      fetchCategories(emit: emit, params: params),
    ]);
  }

  Future<void> onLoadNextPage(
    SearchEventLoadNextPage event,
    Emitter<SearchState> emit,
  ) async {
    if (state is! SearchSuccess) return;
    final current = state as SearchSuccess;
    if (current.hasReachedMax || current.isLoadingMore) return;

    emit(current.copyWith(isLoadingMore: true));
    await fetchProducts(
      emit: emit,
      params: current.params.copyWith(page: current.params.page + 1),
    );
  }

  Future<void> onCategorySelected(
    SearchEventCategorySelected event,
    Emitter<SearchState> emit,
  ) async {
    final newParams = currentParams.copyWith(
      categoryId: event.categoryId,
      page: 1,
    );
    allProducts.clear();
    emit(const SearchLoading());
    await fetchProducts(emit: emit, params: newParams);
  }

  Future<void> onSortChanged(
    SearchEventSortChanged event,
    Emitter<SearchState> emit,
  ) async {
    final newParams = currentParams.copyWith(sort: event.sort, page: 1);
    allProducts.clear();
    emit(const SearchLoading());
    await fetchProducts(emit: emit, params: newParams);
  }

  void onKeywordChanged(
    SearchEventKeywordChanged event,
    Emitter<SearchState> emit,
  ) {
    final newParams = currentParams.copyWith(keyword: event.keyword, page: 1);
    emitFiltered(emit, newParams);
  }

  Future<void> onCleared(
    SearchEventCleared event,
    Emitter<SearchState> emit,
  ) async {
    clearAll();
    const freshParams = SearchFilterParams();
    emit(const SearchLoading());
    await Future.wait([
      fetchProducts(emit: emit, params: freshParams),
      fetchBrands(emit: emit, params: freshParams),
      fetchCategories(emit: emit, params: freshParams),
    ]);
  }

  void onTabChanged(
    SearchEventTabChanged event,
    Emitter<SearchState> emit,
  ) {
    if (state is! SearchSuccess) return;
    final current = state as SearchSuccess;
    emit(current.copyWith(
      params: current.params.copyWith(activeTab: event.tab),
    ));
  }

  Future<void> fetchProducts({
    required Emitter<SearchState> emit,
    required SearchFilterParams params,
  }) async {
    final result = await repo.getProducts(params);

    switch (result) {
      case Success(:final data):
        allProducts.addAll(data.products);
        final reachedMax = data.products.length < params.limit;
        emitFiltered(emit, params, hasReachedMax: reachedMax);

      case Failure(:final message):
        if (state is SearchSuccess) {
          emit((state as SearchSuccess).copyWith(isLoadingMore: false));
        } else {
          emit(SearchError(message));
        }
    }
  }

  Future<void> fetchBrands({
    required Emitter<SearchState> emit,
    required SearchFilterParams params,
  }) async {
    final result = await repo.getBrands(params: params);

    switch (result) {
      case Success(:final data):
        allBrands.addAll(data.brands);
        final current = currentSuccessOrEmpty();
        emit(current.copyWith(brands: List<BrandEntity>.from(allBrands)));

      case Failure():
        break;
    }
  }

  Future<void> fetchCategories({
    required Emitter<SearchState> emit,
    required SearchFilterParams params,
  }) async {
    final result = await repo.getCategories(params: params);

    switch (result) {
      case Success(:final data):
        allCategories.addAll(data.categories);
        final current = currentSuccessOrEmpty();
        emit(current.copyWith(
            categories: List<CategoryEntity>.from(allCategories)));

      case Failure():
        break;
    }
  }

  void emitFiltered(
    Emitter<SearchState> emit,
    SearchFilterParams params, {
    bool? hasReachedMax,
  }) {
    final query = params.keyword.trim().toLowerCase();

    final filteredProducts = applySorting(
      allProducts.where((product) {
        if (query.isEmpty) return true;
        return matchesQuery(query: query, values: [
          product.title,
          product.brand?.name ?? '',
          product.category?.name ?? '',
        ]);
      }).toList(),
      params.sort,
    );

    final filteredBrands = allBrands.where((brand) {
      if (query.isEmpty) return true;
      return matchesQuery(query: query, values: [brand.name]);
    }).toList();

    final filteredCategories = allCategories.where((category) {
      if (query.isEmpty) return true;
      return matchesQuery(query: query, values: [category.name]);
    }).toList();

    final current = currentSuccessOrEmpty();
    emit(current.copyWith(
      params: params,
      products: filteredProducts,
      brands: filteredBrands,
      categories: filteredCategories,
      isLoadingMore: false,
      hasReachedMax: hasReachedMax ?? current.hasReachedMax,
    ));
  }

  bool matchesQuery({
    required String query,
    required List<String> values,
  }) {
    for (final value in values) {
      final normalized = value.trim().toLowerCase();
      if (normalized.startsWith(query)) return true;
      for (final word in normalized.split(RegExp(r'\s+'))) {
        if (word.startsWith(query)) return true;
      }
    }
    return false;
  }

  List<ProductEntity> applySorting(List<ProductEntity> products, String? sort) {
    if (sort == null) return products;
    final sorted = List<ProductEntity>.from(products);
    switch (sort) {
      case 'title':
        sorted.sort((a, b) => a.title.compareTo(b.title));
      case '-title':
        sorted.sort((a, b) => b.title.compareTo(a.title));
      case 'price':
        sorted.sort((a, b) => a.price.compareTo(b.price));
      case '-price':
        sorted.sort((a, b) => b.price.compareTo(a.price));
      case '-sold':
        sorted.sort((a, b) => (b.sold ?? 0).compareTo(a.sold ?? 0));
      case '-rate':
        sorted.sort((a, b) =>
            (b.ratingsAverage ?? 0).compareTo(a.ratingsAverage ?? 0));
      default:
        if (kDebugMode) debugPrint('Unknown sort: $sort');
    }
    return sorted;
  }

  void clearAll() {
    allProducts.clear();
    allBrands.clear();
    allCategories.clear();
  }
}
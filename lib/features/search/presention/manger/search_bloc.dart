import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/data/model/brand_response_model.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';
import 'package:route_smart/core/common/data/repo/all_data_products_repo.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.repository) : super(const SearchState.initial()) {
    on<SearchEventSearch>(onSearch);
    on<SearchEventLoadNextPage>(onLoadNextPage);
    on<SearchEventAutoFetch>(onAutoFetch);
    on<SearchEventCategorySelected>(onCategorySelected);
    on<SearchEventSortChanged>(onSortChanged);
    on<SearchEventCleared>(onCleared);
    on<SearchEventTabChanged>(onTabChanged);
    on<SearchEventKeywordChanged>(onKeywordChanged);
  }

  final AllDataProductsRepository repository;

  final List<ProductDataModel> allFetchedProducts = [];
  final List<BrandData> allFetchedBrands = [];
  final List<CategoryData> allFetchedCategories = [];

  Timer? autoFetchTimer;

  SearchFilterParams get currentParams => switch (state) {
        SearchSuccess(:final params) => params,
        _ => const SearchFilterParams(),
      };

  void startAutoFetch() {
    stopAutoFetch();
    autoFetchTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) {
        if (!isClosed) add(const SearchEvent.autoFetch());
      },
    );
    debugPrint('⏱️ Auto fetch started');
  }

  void stopAutoFetch() {
    autoFetchTimer?.cancel();
    autoFetchTimer = null;
  }

  Future<void> onSearch(
    SearchEventSearch event,
    Emitter<SearchState> emit,
  ) async {
    final params = event.params ?? const SearchFilterParams();

    if (params.page == 1) {
      allFetchedProducts.clear();
      allFetchedBrands.clear();
      allFetchedCategories.clear();
      stopAutoFetch();
      emit(const SearchState.loading());

      await Future.wait([
        fetchProductsFromServer(emit: emit, params: params),
        fetchBrandsFromServer(emit: emit, params: params),
        fetchCategoriesFromServer(emit: emit, params: params),
      ]);

      startAutoFetch();
    } else {
      emitFiltered(emit, params);
    }
  }

  Future<void> onLoadNextPage(
    SearchEventLoadNextPage event,
    Emitter<SearchState> emit,
  ) async {
    if (state is! SearchSuccess) return;
    final current = state as SearchSuccess;
    if (current.hasReachedMax || current.isLoadingMore) return;

    emit(current.copyWith(isLoadingMore: true));

    await fetchProductsFromServer(
      emit: emit,
      params: current.params.copyWith(page: current.params.page + 1),
    );
  }

  Future<void> onAutoFetch(
    SearchEventAutoFetch event,
    Emitter<SearchState> emit,
  ) async {
    if (state is! SearchSuccess) return;
    final current = state as SearchSuccess;
    if (current.hasReachedMax || current.isLoadingMore) {
      stopAutoFetch();
      return;
    }

    emit(current.copyWith(isLoadingMore: true));

    await fetchProductsFromServer(
      emit: emit,
      params: current.params.copyWith(
        page: current.params.page + 1,
        limit: 10,
      ),
    );
  }

  void onKeywordChanged(
    SearchEventKeywordChanged event,
    Emitter<SearchState> emit,
  ) {
    final newParams = currentParams.copyWith(
      keyword: event.keyword,
      page: 1,
    );
    emitFiltered(emit, newParams);
  }

  void onCategorySelected(
    SearchEventCategorySelected event,
    Emitter<SearchState> emit,
  ) {
    final newParams = currentParams.copyWith(
      categoryId: event.categoryId,
      page: 1,
    );
    emitFiltered(emit, newParams); 
  }

  void onSortChanged(
    SearchEventSortChanged event,
    Emitter<SearchState> emit,
  ) {
    final newParams = currentParams.copyWith(
      sort: event.sort,
      page: 1,
    );
    emitFiltered(emit, newParams); // ← Local sort
  }

  void onCleared(
    SearchEventCleared event,
    Emitter<SearchState> emit,
  ) {
    allFetchedProducts.clear();
    allFetchedBrands.clear();
    allFetchedCategories.clear();
    stopAutoFetch();
    add(const SearchEvent.search(params: SearchFilterParams()));
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

  Future<void> fetchProductsFromServer({
    required Emitter<SearchState> emit,
    required SearchFilterParams params,
  }) async {
    final result = await repository.getProduct(params); 
    switch (result) {
      case Success(data: final response):
        final newItems = response.data ?? [];
        allFetchedProducts.addAll(newItems);
        final reachedMax = hasReachedMax(response) || newItems.isEmpty;
        emitFiltered(emit, params, hasReachedMax: reachedMax);
    }
  }

  Future<void> fetchBrandsFromServer({
    required Emitter<SearchState> emit,
    required SearchFilterParams params,
  }) async {
    final result = await repository.getBrands(
      params.page,
      params.keyword.isEmpty ? null : params.keyword,
    );

    switch (result) {
      case Success(data: final response):
        final newBrands = response.data ?? [];
        allFetchedBrands.addAll(newBrands);

        if (state is SearchSuccess) {
          final current = state as SearchSuccess;
          emit(current.copyWith(
            brands: List.from(allFetchedBrands),
            totalBrands: allFetchedBrands.length,
          ));
        }
    }
  }

  Future<void> fetchCategoriesFromServer({
    required Emitter<SearchState> emit,
    required SearchFilterParams params,
  }) async {
    final result = await repository.getCategories(
      params.page,
      params.keyword.isEmpty ? null : params.keyword,
    );

    switch (result) {
      case Success(data: final response):
        final newCategories = response.data;
        allFetchedCategories.addAll(newCategories);

        if (state is SearchSuccess) {
          final current = state as SearchSuccess;
          emit(current.copyWith(
            categories: List.from(allFetchedCategories),
            totalCategories: allFetchedCategories.length,
          ));
        }
    }
  }

  void emitFiltered(
    Emitter<SearchState> emit,
    SearchFilterParams params, {
    bool? hasReachedMax,
  }) {
    final query = params.keyword.trim().toLowerCase();

    var filteredProducts = allFetchedProducts.where((product) {
      // Keyword Filter
      final matchesKeyword = query.isEmpty ||
          (product.title?.toLowerCase().contains(query) ?? false) ||
          (product.brand?.name?.toLowerCase().contains(query) ?? false) ||
          (product.category?.name?.toLowerCase().contains(query) ?? false);

      // Category Filter
      final matchesCategory = params.categoryId == null ||
          product.category?.id == params.categoryId; // أو id حسب الموديل

      final matchesBrand = params.brandId == null ||
          product.brand?.id == params.brandId;

      return matchesKeyword && matchesCategory && matchesBrand;
    }).toList();

    // Apply Sorting
    filteredProducts = _applySorting(filteredProducts, params.sort);

    final filteredBrands = allFetchedBrands.where((brand) {
      if (query.isEmpty) return true;
      return (brand.name ?? '').toLowerCase().contains(query);
    }).toList();

    final filteredCategories = allFetchedCategories.where((category) {
      if (query.isEmpty) return true;
      return category.name.toLowerCase().contains(query);
    }).toList();

    final currentMax = hasReachedMax ??
        (state is SearchSuccess
            ? (state as SearchSuccess).hasReachedMax
            : false);

    if (state is SearchSuccess) {
      final current = state as SearchSuccess;
      emit(current.copyWith(
        params: params,
        products: filteredProducts,
        brands: filteredBrands,
        categories: filteredCategories,
        totalProducts: filteredProducts.length,
        totalBrands: filteredBrands.length,
        totalCategories: filteredCategories.length,
        isLoadingMore: false,
        hasReachedMax: currentMax,
      ));
    } else {
      emit(SearchState.success(
        params: params,
        products: filteredProducts,
        brands: filteredBrands,
        categories: filteredCategories,
        totalProducts: filteredProducts.length,
        totalBrands: filteredBrands.length,
        totalCategories: filteredCategories.length,
        isLoadingMore: false,
        hasReachedMax: currentMax,
      ));
    }
  }

  List<ProductDataModel> _applySorting(
      List<ProductDataModel> products, String? sort) {
    if (sort == null) return products;

    final sorted = List<ProductDataModel>.from(products);

    switch (sort) {
      case 'title':
        sorted.sort((a, b) => (a.title ?? '').compareTo(b.title ?? ''));
      case '-title':
        sorted.sort((a, b) => (b.title ?? '').compareTo(a.title ?? ''));
      case 'price':
        sorted.sort((a, b) => (a.price ?? 0).compareTo(b.price ?? 0));
      case '-price':
        sorted.sort((a, b) => (b.price ?? 0).compareTo(a.price ?? 0));
      case '-sold':
        sorted.sort((a, b) => (b.sold ?? 0).compareTo(a.sold ?? 0));
      case '-rate':
        sorted.sort((a, b) =>
            (b.ratingsAverage ?? 0).compareTo(a.ratingsAverage ?? 0));
    }
    return sorted;
  }

  bool hasReachedMax(dynamic response) {
    final current = response.metadata?.currentPage as int?;
    final total = response.metadata?.numberOfPages as int?;
    if (current == null || total == null) return false;
    return current >= total;
  }

  @override
  Future<void> close() {
    stopAutoFetch();
    return super.close();
  }
}
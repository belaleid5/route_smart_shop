import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/domain/entites/brand_entity.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/core/common/domain/entites/product_entity.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/home/domain/repo/brands_repository.dart';
import 'package:route_smart/features/home/domain/repo/categories_repository.dart';
import 'package:route_smart/features/home/domain/repo/products_repository.dart';
import 'package:route_smart/features/search/domain/entites/search_params.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required BrandsRepository brandsRepository,
    required CategoriesRepository categoriesRepository,
    required ProductsRepository productsRepository,
  })  : _brandsRepository = brandsRepository,
        _categoriesRepository = categoriesRepository,
        _productsRepository = productsRepository,
        super(const SearchInitial()) {
    on<SearchEventSearch>(_onSearch);
    on<SearchEventLoadNextPage>(_onLoadNextPage);
    on<SearchEventCategorySelected>(_onCategorySelected);
    on<SearchEventSortChanged>(_onSortChanged);
    on<SearchEventCleared>(_onCleared);
    on<SearchEventTabChanged>(_onTabChanged);
    on<SearchEventKeywordChanged>(_onKeywordChanged);
  }

  final BrandsRepository _brandsRepository;
  final CategoriesRepository _categoriesRepository;
  final ProductsRepository _productsRepository;

  final List<ProductEntity> _allFetchedProducts = [];
  final List<BrandEntity> _allFetchedBrands = [];
  final List<CategoryEntity> _allFetchedCategories = [];

  SearchFilterParams get _currentParams => switch (state) {
        SearchSuccess(params: final p) => p,
        _ => const SearchFilterParams(),
      };

  SearchSuccess _currentSuccessOrEmpty() => switch (state) {
        SearchSuccess() => state as SearchSuccess,
        _ => const SearchSuccess(
            params: SearchFilterParams(),
            products: [],
            categories: [],
            brands: [],
          ),
      };


  Future<void> _onSearch(
    SearchEventSearch event,
    Emitter<SearchState> emit,
  ) async {
    final params = event.params ?? const SearchFilterParams();

    _allFetchedProducts.clear();
    _allFetchedBrands.clear();
    _allFetchedCategories.clear();

    emit(const SearchLoading());

    await Future.wait([
      _fetchProducts(emit: emit, params: params),
      _fetchBrands(emit: emit, params: params),
      _fetchCategories(emit: emit, params: params),
    ]);
  }

  Future<void> _onLoadNextPage(
    SearchEventLoadNextPage event,
    Emitter<SearchState> emit,
  ) async {
    if (state is! SearchSuccess) return;
    final current = state as SearchSuccess;
    if (current.hasReachedMax || current.isLoadingMore) return;

    emit(current.copyWith(isLoadingMore: true));

    await _fetchProducts(
      emit: emit,
      params: current.params.copyWith(page: current.params.page + 1),
    );
  }

  Future<void> _onCategorySelected(
    SearchEventCategorySelected event,
    Emitter<SearchState> emit,
  ) async {
    final newParams = _currentParams.copyWith(
      categoryId: event.categoryId,
      page: 1,
    );
    _allFetchedProducts.clear();
    emit(const SearchLoading());
    await _fetchProducts(emit: emit, params: newParams);
  }

  Future<void> _onSortChanged(
    SearchEventSortChanged event,
    Emitter<SearchState> emit,
  ) async {
    final newParams = _currentParams.copyWith(sort: event.sort, page: 1);
    _allFetchedProducts.clear();
    emit(const SearchLoading());
    await _fetchProducts(emit: emit, params: newParams);
  }

  void _onKeywordChanged(
    SearchEventKeywordChanged event,
    Emitter<SearchState> emit,
  ) {
    final newParams = _currentParams.copyWith(
      keyword: event.keyword,
      page: 1,
    );
    _emitFiltered(emit, newParams);
  }

  Future<void> _onCleared(
    SearchEventCleared event,
    Emitter<SearchState> emit,
  ) async {
    _allFetchedProducts.clear();
    _allFetchedBrands.clear();
    _allFetchedCategories.clear();

    const freshParams = SearchFilterParams();
    emit(const SearchLoading());

    await Future.wait([
      _fetchProducts(emit: emit, params: freshParams),
      _fetchBrands(emit: emit, params: freshParams),
      _fetchCategories(emit: emit, params: freshParams),
    ]);
  }

  void _onTabChanged(
    SearchEventTabChanged event,
    Emitter<SearchState> emit,
  ) {
    if (state is! SearchSuccess) return;
    final current = state as SearchSuccess;
    emit(
      current.copyWith(
        params: current.params.copyWith(activeTab: event.tab),
      ),
    );
  }

 
  Future<void> _fetchProducts({
    required Emitter<SearchState> emit,
    required SearchFilterParams params,
  }) async {
    final filterParams = params.toFilterParams();
    final result = await _productsRepository.getProducts(
      page: filterParams.page,
    );

    switch (result) {
      case Success(:final data):
        _allFetchedProducts.addAll(data);
        final reachedMax = _hasReachedMax(data, params);
        _emitFiltered(emit, params, hasReachedMax: reachedMax);

      case Failure(:final message):
        if (state is SearchSuccess) {
          final current = state as SearchSuccess;
          emit(current.copyWith(isLoadingMore: false));
        } else {
          emit(SearchError(message));
        }
    }
  }

  Future<void> _fetchBrands({
    required Emitter<SearchState> emit,
    required SearchFilterParams params,
  }) async {
    final result = await _brandsRepository.getBrands(
      page: params.page,
      limit: params.limit,
    );

    switch (result) {
      case Success(:final data):
        _allFetchedBrands.addAll(data);
        final current = _currentSuccessOrEmpty();
        emit(
          current.copyWith(
            brands: List<BrandEntity>.from(_allFetchedBrands),
          ),
        );

      case Failure():
        break;
    }
  }

  Future<void> _fetchCategories({
    required Emitter<SearchState> emit,
    required SearchFilterParams params,
  }) async {
    final result = await _categoriesRepository.getCategories(
      page: params.page,
      limit: params.limit,
    );

    switch (result) {
      case Success(:final data):
        _allFetchedCategories.addAll(data);
        final current = _currentSuccessOrEmpty();
        emit(
          current.copyWith(
            categories: List<CategoryEntity>.from(_allFetchedCategories),
          ),
        );

      case Failure():
        break;
    }
  }


  void _emitFiltered(
    Emitter<SearchState> emit,
    SearchFilterParams params, {
    bool? hasReachedMax,
  }) {
    final query = params.keyword.trim().toLowerCase();

    final filteredProducts = _applySorting(
      _allFetchedProducts.where((product) {
        if (query.isEmpty) return true;
        return _matchesQuery(
          query: query,
          values: [
            product.title,
            product.brand?.name ?? '',
            product.category?.name ?? '',
          ],
        );
      }).toList(),
      params.sort,
    );

    final filteredBrands = _allFetchedBrands.where((brand) {
      if (query.isEmpty) return true;
      return _matchesQuery(
        query: query,
        values: [brand.name],
      );
    }).toList();

    final filteredCategories = _allFetchedCategories.where((category) {
      if (query.isEmpty) return true;
      return _matchesQuery(
        query: query,
        values: [category.name],
      );
    }).toList();

    final current = _currentSuccessOrEmpty();
    final currentMax = hasReachedMax ?? current.hasReachedMax;

    emit(
      current.copyWith(
        params: params,
        products: filteredProducts,
        brands: filteredBrands,
        categories: filteredCategories,
        isLoadingMore: false,
        hasReachedMax: currentMax,
      ),
    );
  }

bool _matchesQuery({
    required String query,
    required List<String> values,
  }) {
    for (final value in values) {
      final normalized = value.trim().toLowerCase();

      if (normalized.startsWith(query)) return true;

      final words = normalized.split(RegExp(r'\s+'));
      for (final word in words) {
        if (word.startsWith(query)) return true;
      }
    }
    return false;
  }

  List<ProductEntity> _applySorting(
    List<ProductEntity> products,
    String? sort,
  ) {
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
        sorted.sort(
          (a, b) => (b.ratingsAverage ?? 0).compareTo(a.ratingsAverage ?? 0),
        );
      default:
        if (kDebugMode) debugPrint('⚠️ Unknown sort value: $sort');
    }

    return sorted;
  }

  bool _hasReachedMax(
    List<ProductEntity> newItems,
    SearchFilterParams params,
  ) {
    return newItems.length < params.limit;
  }
}
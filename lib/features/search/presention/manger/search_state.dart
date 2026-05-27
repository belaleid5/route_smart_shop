// features/search/presentation/manager/search_state.dart

import 'package:route_smart/core/common/domain/entites/brand_entity.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/core/common/domain/entites/product_entity.dart';
import 'package:route_smart/features/search/domain/entites/search_params.dart';

sealed class SearchState {
  const SearchState();
}

final class SearchInitial extends SearchState {
  const SearchInitial();
}

final class SearchLoading extends SearchState {
  const SearchLoading();
}

final class SearchError extends SearchState {
  const SearchError(this.message);
  final String message;
}

final class SearchSuccess extends SearchState {
  const SearchSuccess({
    required this.params,
    required this.products,
    this.categories = const [],
    this.brands = const [],
    this.isLoadingMore = false,
    this.hasReachedMax = false,
  });

  final SearchFilterParams params;
  final List<ProductEntity> products;
  final List<CategoryEntity> categories;
  final List<BrandEntity> brands;
  final bool isLoadingMore;
  final bool hasReachedMax;

  int get totalProducts => products.length;
  int get totalBrands => brands.length;
  int get totalCategories => categories.length;

  SearchSuccess copyWith({
    SearchFilterParams? params,
    List<ProductEntity>? products,
    List<CategoryEntity>? categories,
    List<BrandEntity>? brands,
    bool? isLoadingMore,
    bool? hasReachedMax,
  }) {
    return SearchSuccess(
      params: params ?? this.params,
      products: products ?? this.products,
      categories: categories ?? this.categories,
      brands: brands ?? this.brands,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
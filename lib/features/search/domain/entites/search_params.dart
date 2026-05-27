// features/search/presention/manger/search_params.dart

import 'package:route_smart/core/common/domain/entites/product_filter_params.dart';

enum SearchTab { products, brands, categories }

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

class SearchFilterParams {
  const SearchFilterParams({
    this.keyword = '',
    this.page = 1,
    this.limit = 10,
    this.activeTab = SearchTab.products,
    this.categoryId,
    this.brandId,
    this.sort,
    this.minPrice,
    this.maxPrice,
    this.fields,
  });

  final String keyword;
  final int page;
  final int limit;
  final SearchTab activeTab;

  final String? categoryId;
  final String? brandId;
  final String? sort;
  final String? minPrice;
  final String? maxPrice;
  final String? fields;

  ProductFilterParams toFilterParams() => ProductFilterParams(
        keyword: keyword,
        page: page,
        limit: limit,
        categoryId: categoryId,
        brandId: brandId,
        sort: sort,
        minPrice: minPrice,
        maxPrice: maxPrice,
      );

  SearchFilterParams copyWith({
    String? keyword,
    int? page,
    int? limit,
    SearchTab? activeTab,
    Object? categoryId = _sentinel,
    Object? brandId = _sentinel,
    Object? sort = _sentinel,
    Object? minPrice = _sentinel,
    Object? maxPrice = _sentinel,
    Object? fields = _sentinel,
  }) {
    return SearchFilterParams(
      keyword: keyword ?? this.keyword,
      page: page ?? this.page,
      limit: limit ?? this.limit,
      activeTab: activeTab ?? this.activeTab,
      categoryId: identical(categoryId, _sentinel)
          ? this.categoryId
          : categoryId as String?,
      brandId: identical(brandId, _sentinel) ? this.brandId : brandId as String?,
      sort: identical(sort, _sentinel) ? this.sort : sort as String?,
      minPrice: identical(minPrice, _sentinel) ? this.minPrice : minPrice as String?,
      maxPrice: identical(maxPrice, _sentinel) ? this.maxPrice : maxPrice as String?,
      fields: identical(fields, _sentinel) ? this.fields : fields as String?,
    );
  }

  SearchFilterParams clearFilters() => SearchFilterParams(
        keyword: keyword,
        activeTab: activeTab,
      );

  bool get hasActiveFilters =>
      categoryId != null ||
      brandId != null ||
      sort != null ||
      minPrice != null ||
      maxPrice != null;

  bool get hasKeyword => keyword.trim().isNotEmpty;
}
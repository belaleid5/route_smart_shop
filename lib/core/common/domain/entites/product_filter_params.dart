
class ProductFilterParams {
  const ProductFilterParams({
    this.keyword = '',
    this.page = 1,
    this.limit = 10,
    this.categoryId,
    this.brandId,
    this.sort,
    this.minPrice,
    this.maxPrice,
  });

  final String keyword;
  final int page;
  final int limit;
  final String? categoryId;
  final String? brandId;
  final String? sort;
  final String? minPrice;
  final String? maxPrice;

  ProductFilterParams copyWith({
    String? keyword,
    int? page,
    int? limit,
    String? categoryId,
    String? brandId,
    String? sort,
    String? minPrice,
    String? maxPrice,
  }) {
    return ProductFilterParams(
      keyword: keyword ?? this.keyword,
      page: page ?? this.page,
      limit: limit ?? this.limit,
      categoryId: categoryId ?? this.categoryId,
      brandId: brandId ?? this.brandId,
      sort: sort ?? this.sort,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
    );
  }

  bool get hasActiveFilters =>
      categoryId != null ||
      brandId != null ||
      sort != null ||
      minPrice != null ||
      maxPrice != null;

  bool get hasKeyword => keyword.trim().isNotEmpty;
}
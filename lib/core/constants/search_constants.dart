// lib/features/search/core/search_constants.dart

abstract final class SearchConstants {
  static const String productsEndpoint   = '/api/v1/products';
  static const String categoriesEndpoint = '/api/v1/categories';
  static const String brandsEndpoint     = '/api/v1/brands';

  static const int defaultLimit = 20;

  static const sortOptions = [
    (label: 'Price ↓', value: '-price'),
    (label: 'Price ↑', value: 'price'),
    (label: 'A–Z',     value: 'title'),
  ];
}

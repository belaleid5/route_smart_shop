abstract final class SearchConstants {
  SearchConstants._();

  // Endpoints (Relative to baseUrl)
  static const String productsEndpoint = 'v1/products';
  static const String categoriesEndpoint = 'v1/categories';
  static const String brandsEndpoint = 'v1/brands';

  static const int defaultLimit = 20;
  static const int defaultPage = 1;

  static const List<Map<String, String>> sortOptions = [
    {'label': 'Price: High to Low', 'value': '-price'},
    {'label': 'Price: Low to High', 'value': 'price'},
    {'label': 'Name: A-Z', 'value': 'title'},
    {'label': 'Name: Z-A', 'value': '-title'},
  ];
}
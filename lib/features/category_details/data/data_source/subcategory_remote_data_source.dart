// lib/features/category_details/data/data_source/subcategory_remote_data_source.dart

import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/features/home/data/models/sub_category_response_model.dart';

abstract interface class SubcategoryRemoteDataSource {
  Future<List<Subcategory>> getSubcategories(
    String categoryId,
  );
}

final class SubcategoryRemoteDataSourceImpl
    implements SubcategoryRemoteDataSource {
  const SubcategoryRemoteDataSourceImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<List<Subcategory>> getSubcategories(
    String categoryId,
  ) async {
    final response = await _apiService.getSubcategories(categoryId);

    return response.data ?? [];
  }
}
// lib/features/category_details/data/repositories/category_details_repository_impl.dart

import 'package:route_smart/core/errors/api_error_handler.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/category_details/data/data_source/subcategory_remote_data_source.dart';
import 'package:route_smart/features/category_details/data/models/subcategory_mapper.dart';
import 'package:route_smart/features/category_details/domain/entites/subcategory_entity.dart';
import 'package:route_smart/features/category_details/domain/repo/category_details_repository.dart';

final class CategoryDetailsRepositoryImpl
    implements CategoryDetailsRepository {
  const CategoryDetailsRepositoryImpl(this._remoteDataSource);

  final SubcategoryRemoteDataSource _remoteDataSource;

  @override
  Future<ApiResult<List<SubcategoryEntity>>> getSubcategories(
    String categoryId,
  ) async {
    try {
      final response = await _remoteDataSource.getSubcategories(categoryId);

      final entities = response
          .map((subcategory) => subcategory.toEntity())
          .toList();

      return Success(entities);
    } catch (error) {
      final failure = ErrorHandler.handle(error);

      return Failure(
        failure.apiErrorModel.message ?? ResponseMessage.DEFAULT,
      );
    }
  }
}
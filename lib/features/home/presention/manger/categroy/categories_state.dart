import 'package:route_smart/core/common/domain/entites/category_entity.dart';

sealed class CategoriesState {
  const CategoriesState();
}

final class CategoriesInitial extends CategoriesState {
  const CategoriesInitial();
}

final class CategoriesLoading extends CategoriesState {
  const CategoriesLoading();
}

final class CategoriesSuccess extends CategoriesState {
  const CategoriesSuccess({
    this.categories = const [],
    this.hasReachedMax = false,
  });

  final List<CategoryEntity> categories;
  final bool hasReachedMax;

  CategoriesSuccess copyWith({
    List<CategoryEntity>? categories,
    bool? hasReachedMax,
  }) {
    return CategoriesSuccess(
      categories: categories ?? this.categories,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }


}

final class CategoriesError extends CategoriesState {
  const CategoriesError(this.message);
  final String message;

  
}
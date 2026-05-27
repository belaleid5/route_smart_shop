// lib/features/category_details/presentation/manager/category_details_state.dart

import 'package:route_smart/features/category_details/domain/entites/subcategory_entity.dart';

sealed class CategoryDetailsState {
  const CategoryDetailsState();
}

final class CategoryDetailsInitial extends CategoryDetailsState {
  const CategoryDetailsInitial();
}

final class CategoryDetailsLoading extends CategoryDetailsState {
  const CategoryDetailsLoading();
}

final class CategoryDetailsLoaded extends CategoryDetailsState {
  const CategoryDetailsLoaded({
    required this.subcategories,
  });

  final List<SubcategoryEntity> subcategories;
}

final class CategoryDetailsError extends CategoryDetailsState {
  const CategoryDetailsError(this.message);

  final String message;
}
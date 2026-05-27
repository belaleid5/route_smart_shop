// lib/features/category_details/presentation/manager/category_details_event.dart

sealed class CategoryDetailsEvent {
  const CategoryDetailsEvent();
}

final class FetchSubcategoriesEvent extends CategoryDetailsEvent {
  const FetchSubcategoriesEvent({
    required this.categoryId,
  });

  final String categoryId;
}
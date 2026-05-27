sealed class CategoriesEvent {
  const CategoriesEvent();
}

final class GetCategoriesEvent extends CategoriesEvent {
  const GetCategoriesEvent();
}

final class RefreshCategoriesEvent extends CategoriesEvent {
  const RefreshCategoriesEvent();
}
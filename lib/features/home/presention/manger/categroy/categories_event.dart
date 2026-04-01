import 'package:freezed_annotation/freezed_annotation.dart';
part 'categories_event.freezed.dart';
 
@freezed
class CategoriesEvent with _$CategoriesEvent {
  const factory CategoriesEvent.getCategories() = GetCategoriesEvent;
  const factory CategoriesEvent.refreshCategories() = RefreshCategoriesEvent;
}
import 'package:freezed_annotation/freezed_annotation.dart';
part 'brands_event.freezed.dart';
 
@freezed
class BrandsEvent with _$BrandsEvent {
  const factory BrandsEvent.getBrands() = GetBrandsEvent;
  const factory BrandsEvent.refreshBrands() = RefreshBrandsEvent;
}
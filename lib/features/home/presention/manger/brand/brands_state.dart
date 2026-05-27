import 'package:route_smart/core/common/domain/entites/brand_entity.dart';

sealed class BrandsState {
  const BrandsState();
}

final class BrandsInitial extends BrandsState {
  const BrandsInitial();
}

final class BrandsLoading extends BrandsState {
  const BrandsLoading();
}

final class BrandsSuccess extends BrandsState {
  const BrandsSuccess({
    this.brands = const [],
    this.hasReachedMax = false,
  });

  final List<BrandEntity> brands;
  final bool hasReachedMax;

  BrandsSuccess copyWith({
    List<BrandEntity>? brands,
    bool? hasReachedMax,
  }) {
    return BrandsSuccess(
      brands: brands ?? this.brands,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  // ✅ تم حذف operator == و hashCode و helper functions
  // السبب: Bloc بيقارن الـ states بـ == قبل الـ emit
  // لو override بيرجع true → BlocBuilder مش بيعمل rebuild
}

final class BrandsError extends BrandsState {
  const BrandsError(this.message);
  final String message;

}
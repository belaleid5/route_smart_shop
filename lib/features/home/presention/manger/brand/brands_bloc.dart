// features/home/presentation/manger/brand/brands_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/domain/entites/brand_entity.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/core/common/domain/usease/get_brands_use_case.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_event.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_state.dart';


class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  final GetBrandsUseCase _getBrandsUseCase;

  int _currentPage = 1;
  static const int _pageLimit = 10;

  BrandsBloc(this._getBrandsUseCase) : super(const BrandsInitial()) {
    on<GetBrandsEvent>(_onGetBrands);
    on<RefreshBrandsEvent>(_onRefreshBrands);
  }

  Future<void> _onGetBrands(
    GetBrandsEvent event,
    Emitter<BrandsState> emit,
  ) async {
    if (state case BrandsSuccess(hasReachedMax: true)) {
      return;
    }

    if (state is! BrandsSuccess) {
      emit(const BrandsLoading());
    }

    final result = await _getBrandsUseCase(
      GetBrandsParams(page: _currentPage, limit: _pageLimit),
    );

    switch (result) {
      case Success(data: final newBrands):
        final hasReachedMax = newBrands.isEmpty;

        final currentBrands = state is BrandsSuccess
            ? (state as BrandsSuccess).brands
            : <BrandEntity>[];

        emit(
          BrandsSuccess(
            brands: [...currentBrands, ...newBrands],
            hasReachedMax: hasReachedMax,
          ),
        );

        if (!hasReachedMax) {
          _currentPage++;
        }

      case Failure(message: final errorMsg):
        emit(BrandsError(errorMsg));
    }
  }

  void _onRefreshBrands(
    RefreshBrandsEvent event,
    Emitter<BrandsState> emit,
  ) {
    _currentPage = 1;
    emit(const BrandsInitial());
    add(const GetBrandsEvent());
  }
}
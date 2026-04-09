import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/data/model/brand_response_model.dart';
import 'package:route_smart/core/common/data/repo/all_data_products_repo.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_event.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_state.dart';

class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  final AllDataProductsRepository _homeRepository;
  int _currentPage = 1;

  BrandsBloc(this._homeRepository) : super(const BrandsState.initial()) {
    on<GetBrandsEvent>(_onGetBrands);
  }

  Future<void> _onGetBrands(
    GetBrandsEvent event,
    Emitter<BrandsState> emit,
  ) async {
    final bool reachedMax = state.maybeWhen(
      success: (brands, hasReachedMax) => hasReachedMax,
      orElse: () => false,
    );

    if (reachedMax) return;

    state.maybeWhen(
      success: (_, __) => null,
      orElse: () => emit(const BrandsState.loading()),
    );

    final result = await _homeRepository.getBrands(_currentPage,
    null);

    result.when(
      success: (response) {
        final List<BrandData> newItems = response.data ?? [];
        final bool isMax =
            (response.metadata?.currentPage ?? 0) >=
            (response.metadata?.numberOfPages ?? 0);

        state.maybeWhen(
          success: (oldBrands, _) {
            emit(
              BrandsState.success(
                brands: oldBrands + newItems,
                hasReachedMax: isMax || newItems.isEmpty,
              ),
            );
          },
          orElse: () {
            emit(
              BrandsState.success(
                brands: newItems,
                hasReachedMax: isMax || newItems.isEmpty,
              ),
            );
          },
        );
        _currentPage++;
      },
      failure: (message) => emit(BrandsState.error(message)),
    );
  }
}

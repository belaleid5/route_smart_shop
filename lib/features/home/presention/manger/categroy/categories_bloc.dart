import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/common/data/repo/all_data_products_repo.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_event.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final AllDataProductsRepository _homeRepository;
  int _currentPage = 1;

  CategoriesBloc(this._homeRepository)
    : super(const CategoriesState.initial()) {
    on<GetCategoriesEvent>(_onGetCategories);
  }

  Future<void> _onGetCategories(
    GetCategoriesEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    final bool reachedMax = state.maybeWhen(
      success: (categories, hasReachedMax) => hasReachedMax,
      orElse: () => false,
    );

    if (reachedMax) return;

    state.maybeWhen(
      success: (_, __) => null,
      orElse: () => emit(const CategoriesState.loading()),
    );

    final result = await _homeRepository.getCategories(_currentPage, null);

    result.when(
      success: (response) {
        final List<CategoryData> newItems = response.data ?? [];
        final bool isMax =
            (response.metadata?.currentPage ?? 0) >=
            (response.metadata?.numberOfPages ?? 0);

        state.maybeWhen(
          success: (oldCategories, _) {
            emit(
              CategoriesState.success(
                categories: oldCategories + newItems,
                hasReachedMax: isMax || newItems.isEmpty,
              ),
            );
          },
          orElse: () {
            emit(
              CategoriesState.success(
                categories: newItems,
                hasReachedMax: isMax || newItems.isEmpty,
              ),
            );
          },
        );
        _currentPage++;
      },
      failure: (message) => emit(CategoriesState.error(message)),
    );
  }
}

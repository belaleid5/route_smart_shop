import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';
import 'package:route_smart/core/common/data/repo/all_data_products_repo.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/home/presention/manger/product/product_event.dart';
import 'package:route_smart/features/home/presention/manger/product/product_state.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final AllDataProductsRepository _homeRepository;
  int _currentPage = 1;

  ProductsBloc(this._homeRepository) : super(const ProductsState.initial()) {
    on<GetProductsEvent>(_onGetProducts);
    on<RefreshProductsEvent>(_onRefreshProducts);
  }

  Future<void> _onGetProducts(
    GetProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    // ✅ Guard: stop if already reached max
    final bool reachedMax = state.maybeMap(
      success: (s) => s.hasReachedMax,
      orElse: () => false,
    );
    if (reachedMax) return;

    // ✅ Only show loading on first page
    final bool isSuccess = state.maybeMap(
      success: (_) => true,
      orElse: () => false,
    );
    if (!isSuccess) {
      emit(const ProductsState.loading());
    }

    final params = SearchFilterParams(page: _currentPage);
    final result = await _homeRepository.getProduct(params);

    result.when(
      success: (response) {
        final List<ProductDataModel> newItems = response.data ?? [];

        state.maybeMap(
          success: (s) {
            emit(
              s.copyWith(
                products: s.products + newItems,
                hasReachedMax: newItems.isEmpty,
              ),
            );
          },
          orElse: () {
            emit(
              ProductsState.success(
                products: newItems,
                hasReachedMax: newItems.isEmpty,
              ),
            );
          },
        );

        _currentPage++; 
      },
      failure: (error) => emit(ProductsState.error(error)),
    );
  }

  Future<void> _onRefreshProducts(
    RefreshProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    _currentPage = 1; // ✅ reset page on refresh
    emit(const ProductsState.initial());
    add(const GetProductsEvent());
  }
}
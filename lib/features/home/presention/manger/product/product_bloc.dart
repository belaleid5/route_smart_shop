import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/domain/entites/product_entity.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/core/common/domain/usease/get_products_use_case.dart';
import 'package:route_smart/features/home/presention/manger/product/product_event.dart';
import 'package:route_smart/features/home/presention/manger/product/product_state.dart';


class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUseCase _getProductsUseCase;

  int _currentPage = 1;


  ProductsBloc(this._getProductsUseCase) : super(const ProductsInitial()) {
    on<GetProductsEvent>(_onGetProducts);
    on<RefreshProductsEvent>(_onRefreshProducts);
  }

  Future<void> _onGetProducts(
    GetProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {

    if (state case ProductsSuccess(hasReachedMax: true)) return;


    if (state is! ProductsSuccess) {
      emit(const ProductsLoading());
    }

    final result = await _getProductsUseCase(
      GetProductsParams(page: _currentPage),
    );

    switch (result) {
      case Success(data: final newProducts):
        final hasReachedMax = newProducts.isEmpty;

        final currentProducts = state is ProductsSuccess
            ? (state as ProductsSuccess).products
            : <ProductEntity>[];

        emit(ProductsSuccess(
          products: [...currentProducts, ...newProducts],
          hasReachedMax: hasReachedMax,
        ));

        if (!hasReachedMax) {
          _currentPage++;
        }

      case Failure(message: final errorMsg):
        emit(ProductsError(errorMsg));
    }
  }

  void _onRefreshProducts(
    RefreshProductsEvent event,
    Emitter<ProductsState> emit,
  ) {
    _currentPage = 1;
    emit(const ProductsInitial());
    add(const GetProductsEvent());
  }
}
// features/details/presentation/manager/product_details_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/features/details/domain/usecase/get_product_details_use_case.dart';
import 'package:route_smart/features/details/presention/manger/product_details_event.dart';
import 'package:route_smart/features/details/presention/manger/product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductDetailsUseCase _getProductDetailsUseCase;

  ProductDetailsBloc(this._getProductDetailsUseCase) 
      : super(const ProductDetailsInitial()) {
    on<ProductDetailsRequested>(_onProductDetailsRequested);
  }

  Future<void> _onProductDetailsRequested(
    ProductDetailsRequested event,
    Emitter<ProductDetailsState> emit,
  ) async {
   
    emit(const ProductDetailsInProgress());

    
    final result = await _getProductDetailsUseCase(event.productId);

 
    result.map(
      success: (productEntity) {
        emit(ProductDetailsSuccess(productEntity));
      },
      failure: (message) {
        emit(ProductDetailsFailure(message));
      },
    );
  }
}
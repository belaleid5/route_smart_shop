import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/details/data/repo/product_details_repo.dart';
import 'package:route_smart/features/details/presention/manger/product_details_event.dart';
import 'package:route_smart/features/details/presention/manger/product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final ProductDetailsRepository repository;

  ProductDetailsBloc(this.repository)
      : super(const ProductDetailsState.initial()) {
    on<GetProductDetailsEvent>(onGetProductDetails);
  }

  Future<void> onGetProductDetails(
    GetProductDetailsEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(const ProductDetailsState.loading());

    final result = await repository.getProductDetails(event.productId);

    result.when(
      success: (response) {
        if (response.data == null) {
          emit(const ProductDetailsState.error('Product not found'));
          return;
        }
        emit(ProductDetailsState.success(response.data!));
      },
      failure: (message) => emit(ProductDetailsState.error(message)),
    );
  }
}

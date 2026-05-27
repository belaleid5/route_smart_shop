// lib/features/category_details/presentation/manager/category_details_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/category_details/domain/usecase/get_subcategories_use_case.dart';
import 'package:route_smart/features/category_details/presention/manger/category_details_event.dart';
import 'package:route_smart/features/category_details/presention/manger/category_details_state.dart';

final class CategoryDetailsBloc
    extends Bloc<CategoryDetailsEvent, CategoryDetailsState> {
  CategoryDetailsBloc(this._getSubcategoriesUseCase)
      : super(const CategoryDetailsInitial()) {
    on<FetchSubcategoriesEvent>(_onFetchSubcategories);
  }

  final GetSubcategoriesUseCase _getSubcategoriesUseCase;

  Future<void> _onFetchSubcategories(
    FetchSubcategoriesEvent event,
    Emitter<CategoryDetailsState> emit,
  ) async {
    emit(const CategoryDetailsLoading());

    final result = await _getSubcategoriesUseCase(
      event.categoryId,
    );

    switch (result) {
      case Success(:final data):
        emit(
          CategoryDetailsLoaded(
            subcategories: data,
          ),
        );

      case Failure(:final message):
        emit(
          CategoryDetailsError(message),
        );
    }
  }
}
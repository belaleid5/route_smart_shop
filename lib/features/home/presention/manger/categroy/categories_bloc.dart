// ============ categories_bloc.dart ============
 
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/core/common/domain/usease/get_categories_use_case.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_event.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_state.dart';
 
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
 
  int _currentPage = 1;
  static const int _pageLimit = 10;
 
  CategoriesBloc(this._getCategoriesUseCase) : super(const CategoriesInitial()) {
    on<GetCategoriesEvent>(_onGetCategories);
    on<RefreshCategoriesEvent>(_onRefreshCategories);
  }
 
  Future<void> _onGetCategories(
    GetCategoriesEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    if (kDebugMode) print('🟡 CategoriesBloc: onEvent GetCategoriesEvent, page=$_currentPage');
 
    if (state case CategoriesSuccess(hasReachedMax: true)) {
      if (kDebugMode) print('🔵 CategoriesBloc: hasReachedMax=true, skipping');
      return;
    }
 
    if (state is! CategoriesSuccess) {
      emit(const CategoriesLoading());
      if (kDebugMode) print('🟡 CategoriesBloc: emitting CategoriesLoading');
    }
 
    final result = await _getCategoriesUseCase(
      GetCategoriesParams(page: _currentPage, limit: _pageLimit),
    );
 
    switch (result) {
      case Success(data: final newCategories):
        if (kDebugMode) print('✅ CategoriesBloc: fetched ${newCategories.length} categories');
 
        final hasReachedMax = newCategories.length < _pageLimit;
 
        final currentCategories = state is CategoriesSuccess
            ? (state as CategoriesSuccess).categories
            : <CategoryEntity>[];
 
        final newState = CategoriesSuccess(
          categories: [...currentCategories, ...newCategories],
          hasReachedMax: hasReachedMax,
        );
 
        if (kDebugMode) print('✅ CategoriesBloc: emitting CategoriesSuccess with ${newState.categories.length} items');
        emit(newState);
 
        if (!hasReachedMax) _currentPage++;
 
      case Failure(message: final msg):
        if (kDebugMode) print('❌ CategoriesBloc: error - $msg');
        emit(CategoriesError(msg));
    }
  }
 
  void _onRefreshCategories(
    RefreshCategoriesEvent event,
    Emitter<CategoriesState> emit,
  ) {
    _currentPage = 1;
    emit(const CategoriesInitial());
    add(const GetCategoriesEvent());
  }
}
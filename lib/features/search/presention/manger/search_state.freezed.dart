// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState()';
}


}

/// @nodoc
class $SearchStateCopyWith<$Res>  {
$SearchStateCopyWith(SearchState _, $Res Function(SearchState) __);
}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchInitial value)?  initial,TResult Function( SearchLoading value)?  loading,TResult Function( SearchSuccess value)?  success,TResult Function( SearchError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchInitial() when initial != null:
return initial(_that);case SearchLoading() when loading != null:
return loading(_that);case SearchSuccess() when success != null:
return success(_that);case SearchError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchInitial value)  initial,required TResult Function( SearchLoading value)  loading,required TResult Function( SearchSuccess value)  success,required TResult Function( SearchError value)  error,}){
final _that = this;
switch (_that) {
case SearchInitial():
return initial(_that);case SearchLoading():
return loading(_that);case SearchSuccess():
return success(_that);case SearchError():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchInitial value)?  initial,TResult? Function( SearchLoading value)?  loading,TResult? Function( SearchSuccess value)?  success,TResult? Function( SearchError value)?  error,}){
final _that = this;
switch (_that) {
case SearchInitial() when initial != null:
return initial(_that);case SearchLoading() when loading != null:
return loading(_that);case SearchSuccess() when success != null:
return success(_that);case SearchError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( SearchFilterParams params,  List<ProductDataModel> products,  List<CategoryData> categories,  List<BrandData> brands,  int totalProducts,  int totalBrands,  int totalCategories,  bool isLoadingMore,  bool hasReachedMax)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchInitial() when initial != null:
return initial();case SearchLoading() when loading != null:
return loading();case SearchSuccess() when success != null:
return success(_that.params,_that.products,_that.categories,_that.brands,_that.totalProducts,_that.totalBrands,_that.totalCategories,_that.isLoadingMore,_that.hasReachedMax);case SearchError() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( SearchFilterParams params,  List<ProductDataModel> products,  List<CategoryData> categories,  List<BrandData> brands,  int totalProducts,  int totalBrands,  int totalCategories,  bool isLoadingMore,  bool hasReachedMax)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case SearchInitial():
return initial();case SearchLoading():
return loading();case SearchSuccess():
return success(_that.params,_that.products,_that.categories,_that.brands,_that.totalProducts,_that.totalBrands,_that.totalCategories,_that.isLoadingMore,_that.hasReachedMax);case SearchError():
return error(_that.message);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( SearchFilterParams params,  List<ProductDataModel> products,  List<CategoryData> categories,  List<BrandData> brands,  int totalProducts,  int totalBrands,  int totalCategories,  bool isLoadingMore,  bool hasReachedMax)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case SearchInitial() when initial != null:
return initial();case SearchLoading() when loading != null:
return loading();case SearchSuccess() when success != null:
return success(_that.params,_that.products,_that.categories,_that.brands,_that.totalProducts,_that.totalBrands,_that.totalCategories,_that.isLoadingMore,_that.hasReachedMax);case SearchError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class SearchInitial implements SearchState {
  const SearchInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.initial()';
}


}




/// @nodoc


class SearchLoading implements SearchState {
  const SearchLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.loading()';
}


}




/// @nodoc


class SearchSuccess implements SearchState {
  const SearchSuccess({required this.params, required final  List<ProductDataModel> products, final  List<CategoryData> categories = const [], final  List<BrandData> brands = const [], this.totalProducts = 0, this.totalBrands = 0, this.totalCategories = 0, this.isLoadingMore = false, this.hasReachedMax = false}): _products = products,_categories = categories,_brands = brands;
  

 final  SearchFilterParams params;
 final  List<ProductDataModel> _products;
 List<ProductDataModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  List<CategoryData> _categories;
@JsonKey() List<CategoryData> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<BrandData> _brands;
@JsonKey() List<BrandData> get brands {
  if (_brands is EqualUnmodifiableListView) return _brands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_brands);
}

@JsonKey() final  int totalProducts;
@JsonKey() final  int totalBrands;
@JsonKey() final  int totalCategories;
@JsonKey() final  bool isLoadingMore;
@JsonKey() final  bool hasReachedMax;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSuccessCopyWith<SearchSuccess> get copyWith => _$SearchSuccessCopyWithImpl<SearchSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSuccess&&(identical(other.params, params) || other.params == params)&&const DeepCollectionEquality().equals(other._products, _products)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._brands, _brands)&&(identical(other.totalProducts, totalProducts) || other.totalProducts == totalProducts)&&(identical(other.totalBrands, totalBrands) || other.totalBrands == totalBrands)&&(identical(other.totalCategories, totalCategories) || other.totalCategories == totalCategories)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax));
}


@override
int get hashCode => Object.hash(runtimeType,params,const DeepCollectionEquality().hash(_products),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_brands),totalProducts,totalBrands,totalCategories,isLoadingMore,hasReachedMax);

@override
String toString() {
  return 'SearchState.success(params: $params, products: $products, categories: $categories, brands: $brands, totalProducts: $totalProducts, totalBrands: $totalBrands, totalCategories: $totalCategories, isLoadingMore: $isLoadingMore, hasReachedMax: $hasReachedMax)';
}


}

/// @nodoc
abstract mixin class $SearchSuccessCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchSuccessCopyWith(SearchSuccess value, $Res Function(SearchSuccess) _then) = _$SearchSuccessCopyWithImpl;
@useResult
$Res call({
 SearchFilterParams params, List<ProductDataModel> products, List<CategoryData> categories, List<BrandData> brands, int totalProducts, int totalBrands, int totalCategories, bool isLoadingMore, bool hasReachedMax
});




}
/// @nodoc
class _$SearchSuccessCopyWithImpl<$Res>
    implements $SearchSuccessCopyWith<$Res> {
  _$SearchSuccessCopyWithImpl(this._self, this._then);

  final SearchSuccess _self;
  final $Res Function(SearchSuccess) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,Object? products = null,Object? categories = null,Object? brands = null,Object? totalProducts = null,Object? totalBrands = null,Object? totalCategories = null,Object? isLoadingMore = null,Object? hasReachedMax = null,}) {
  return _then(SearchSuccess(
params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as SearchFilterParams,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductDataModel>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryData>,brands: null == brands ? _self._brands : brands // ignore: cast_nullable_to_non_nullable
as List<BrandData>,totalProducts: null == totalProducts ? _self.totalProducts : totalProducts // ignore: cast_nullable_to_non_nullable
as int,totalBrands: null == totalBrands ? _self.totalBrands : totalBrands // ignore: cast_nullable_to_non_nullable
as int,totalCategories: null == totalCategories ? _self.totalCategories : totalCategories // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class SearchError implements SearchState {
  const SearchError(this.message);
  

 final  String message;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchErrorCopyWith<SearchError> get copyWith => _$SearchErrorCopyWithImpl<SearchError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SearchState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $SearchErrorCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchErrorCopyWith(SearchError value, $Res Function(SearchError) _then) = _$SearchErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SearchErrorCopyWithImpl<$Res>
    implements $SearchErrorCopyWith<$Res> {
  _$SearchErrorCopyWithImpl(this._self, this._then);

  final SearchError _self;
  final $Res Function(SearchError) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SearchError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

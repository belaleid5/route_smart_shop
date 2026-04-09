// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent()';
}


}

/// @nodoc
class $SearchEventCopyWith<$Res>  {
$SearchEventCopyWith(SearchEvent _, $Res Function(SearchEvent) __);
}


/// Adds pattern-matching-related methods to [SearchEvent].
extension SearchEventPatterns on SearchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchEventSearch value)?  search,TResult Function( SearchEventLoadNextPage value)?  loadNextPage,TResult Function( SearchEventAutoFetch value)?  autoFetch,TResult Function( SearchEventCategorySelected value)?  categorySelected,TResult Function( SearchEventSortChanged value)?  sortChanged,TResult Function( SearchEventCleared value)?  cleared,TResult Function( SearchEventTabChanged value)?  tabChanged,TResult Function( SearchEventKeywordChanged value)?  keywordChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchEventSearch() when search != null:
return search(_that);case SearchEventLoadNextPage() when loadNextPage != null:
return loadNextPage(_that);case SearchEventAutoFetch() when autoFetch != null:
return autoFetch(_that);case SearchEventCategorySelected() when categorySelected != null:
return categorySelected(_that);case SearchEventSortChanged() when sortChanged != null:
return sortChanged(_that);case SearchEventCleared() when cleared != null:
return cleared(_that);case SearchEventTabChanged() when tabChanged != null:
return tabChanged(_that);case SearchEventKeywordChanged() when keywordChanged != null:
return keywordChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchEventSearch value)  search,required TResult Function( SearchEventLoadNextPage value)  loadNextPage,required TResult Function( SearchEventAutoFetch value)  autoFetch,required TResult Function( SearchEventCategorySelected value)  categorySelected,required TResult Function( SearchEventSortChanged value)  sortChanged,required TResult Function( SearchEventCleared value)  cleared,required TResult Function( SearchEventTabChanged value)  tabChanged,required TResult Function( SearchEventKeywordChanged value)  keywordChanged,}){
final _that = this;
switch (_that) {
case SearchEventSearch():
return search(_that);case SearchEventLoadNextPage():
return loadNextPage(_that);case SearchEventAutoFetch():
return autoFetch(_that);case SearchEventCategorySelected():
return categorySelected(_that);case SearchEventSortChanged():
return sortChanged(_that);case SearchEventCleared():
return cleared(_that);case SearchEventTabChanged():
return tabChanged(_that);case SearchEventKeywordChanged():
return keywordChanged(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchEventSearch value)?  search,TResult? Function( SearchEventLoadNextPage value)?  loadNextPage,TResult? Function( SearchEventAutoFetch value)?  autoFetch,TResult? Function( SearchEventCategorySelected value)?  categorySelected,TResult? Function( SearchEventSortChanged value)?  sortChanged,TResult? Function( SearchEventCleared value)?  cleared,TResult? Function( SearchEventTabChanged value)?  tabChanged,TResult? Function( SearchEventKeywordChanged value)?  keywordChanged,}){
final _that = this;
switch (_that) {
case SearchEventSearch() when search != null:
return search(_that);case SearchEventLoadNextPage() when loadNextPage != null:
return loadNextPage(_that);case SearchEventAutoFetch() when autoFetch != null:
return autoFetch(_that);case SearchEventCategorySelected() when categorySelected != null:
return categorySelected(_that);case SearchEventSortChanged() when sortChanged != null:
return sortChanged(_that);case SearchEventCleared() when cleared != null:
return cleared(_that);case SearchEventTabChanged() when tabChanged != null:
return tabChanged(_that);case SearchEventKeywordChanged() when keywordChanged != null:
return keywordChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SearchFilterParams? params)?  search,TResult Function()?  loadNextPage,TResult Function()?  autoFetch,TResult Function( String? categoryId)?  categorySelected,TResult Function( String? sort)?  sortChanged,TResult Function()?  cleared,TResult Function( SearchTab tab)?  tabChanged,TResult Function( String keyword)?  keywordChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchEventSearch() when search != null:
return search(_that.params);case SearchEventLoadNextPage() when loadNextPage != null:
return loadNextPage();case SearchEventAutoFetch() when autoFetch != null:
return autoFetch();case SearchEventCategorySelected() when categorySelected != null:
return categorySelected(_that.categoryId);case SearchEventSortChanged() when sortChanged != null:
return sortChanged(_that.sort);case SearchEventCleared() when cleared != null:
return cleared();case SearchEventTabChanged() when tabChanged != null:
return tabChanged(_that.tab);case SearchEventKeywordChanged() when keywordChanged != null:
return keywordChanged(_that.keyword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SearchFilterParams? params)  search,required TResult Function()  loadNextPage,required TResult Function()  autoFetch,required TResult Function( String? categoryId)  categorySelected,required TResult Function( String? sort)  sortChanged,required TResult Function()  cleared,required TResult Function( SearchTab tab)  tabChanged,required TResult Function( String keyword)  keywordChanged,}) {final _that = this;
switch (_that) {
case SearchEventSearch():
return search(_that.params);case SearchEventLoadNextPage():
return loadNextPage();case SearchEventAutoFetch():
return autoFetch();case SearchEventCategorySelected():
return categorySelected(_that.categoryId);case SearchEventSortChanged():
return sortChanged(_that.sort);case SearchEventCleared():
return cleared();case SearchEventTabChanged():
return tabChanged(_that.tab);case SearchEventKeywordChanged():
return keywordChanged(_that.keyword);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SearchFilterParams? params)?  search,TResult? Function()?  loadNextPage,TResult? Function()?  autoFetch,TResult? Function( String? categoryId)?  categorySelected,TResult? Function( String? sort)?  sortChanged,TResult? Function()?  cleared,TResult? Function( SearchTab tab)?  tabChanged,TResult? Function( String keyword)?  keywordChanged,}) {final _that = this;
switch (_that) {
case SearchEventSearch() when search != null:
return search(_that.params);case SearchEventLoadNextPage() when loadNextPage != null:
return loadNextPage();case SearchEventAutoFetch() when autoFetch != null:
return autoFetch();case SearchEventCategorySelected() when categorySelected != null:
return categorySelected(_that.categoryId);case SearchEventSortChanged() when sortChanged != null:
return sortChanged(_that.sort);case SearchEventCleared() when cleared != null:
return cleared();case SearchEventTabChanged() when tabChanged != null:
return tabChanged(_that.tab);case SearchEventKeywordChanged() when keywordChanged != null:
return keywordChanged(_that.keyword);case _:
  return null;

}
}

}

/// @nodoc


class SearchEventSearch implements SearchEvent {
  const SearchEventSearch({this.params});
  

 final  SearchFilterParams? params;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchEventSearchCopyWith<SearchEventSearch> get copyWith => _$SearchEventSearchCopyWithImpl<SearchEventSearch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEventSearch&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'SearchEvent.search(params: $params)';
}


}

/// @nodoc
abstract mixin class $SearchEventSearchCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $SearchEventSearchCopyWith(SearchEventSearch value, $Res Function(SearchEventSearch) _then) = _$SearchEventSearchCopyWithImpl;
@useResult
$Res call({
 SearchFilterParams? params
});




}
/// @nodoc
class _$SearchEventSearchCopyWithImpl<$Res>
    implements $SearchEventSearchCopyWith<$Res> {
  _$SearchEventSearchCopyWithImpl(this._self, this._then);

  final SearchEventSearch _self;
  final $Res Function(SearchEventSearch) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = freezed,}) {
  return _then(SearchEventSearch(
params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as SearchFilterParams?,
  ));
}


}

/// @nodoc


class SearchEventLoadNextPage implements SearchEvent {
  const SearchEventLoadNextPage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEventLoadNextPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.loadNextPage()';
}


}




/// @nodoc


class SearchEventAutoFetch implements SearchEvent {
  const SearchEventAutoFetch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEventAutoFetch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.autoFetch()';
}


}




/// @nodoc


class SearchEventCategorySelected implements SearchEvent {
  const SearchEventCategorySelected({required this.categoryId});
  

 final  String? categoryId;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchEventCategorySelectedCopyWith<SearchEventCategorySelected> get copyWith => _$SearchEventCategorySelectedCopyWithImpl<SearchEventCategorySelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEventCategorySelected&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'SearchEvent.categorySelected(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $SearchEventCategorySelectedCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $SearchEventCategorySelectedCopyWith(SearchEventCategorySelected value, $Res Function(SearchEventCategorySelected) _then) = _$SearchEventCategorySelectedCopyWithImpl;
@useResult
$Res call({
 String? categoryId
});




}
/// @nodoc
class _$SearchEventCategorySelectedCopyWithImpl<$Res>
    implements $SearchEventCategorySelectedCopyWith<$Res> {
  _$SearchEventCategorySelectedCopyWithImpl(this._self, this._then);

  final SearchEventCategorySelected _self;
  final $Res Function(SearchEventCategorySelected) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = freezed,}) {
  return _then(SearchEventCategorySelected(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SearchEventSortChanged implements SearchEvent {
  const SearchEventSortChanged({required this.sort});
  

 final  String? sort;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchEventSortChangedCopyWith<SearchEventSortChanged> get copyWith => _$SearchEventSortChangedCopyWithImpl<SearchEventSortChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEventSortChanged&&(identical(other.sort, sort) || other.sort == sort));
}


@override
int get hashCode => Object.hash(runtimeType,sort);

@override
String toString() {
  return 'SearchEvent.sortChanged(sort: $sort)';
}


}

/// @nodoc
abstract mixin class $SearchEventSortChangedCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $SearchEventSortChangedCopyWith(SearchEventSortChanged value, $Res Function(SearchEventSortChanged) _then) = _$SearchEventSortChangedCopyWithImpl;
@useResult
$Res call({
 String? sort
});




}
/// @nodoc
class _$SearchEventSortChangedCopyWithImpl<$Res>
    implements $SearchEventSortChangedCopyWith<$Res> {
  _$SearchEventSortChangedCopyWithImpl(this._self, this._then);

  final SearchEventSortChanged _self;
  final $Res Function(SearchEventSortChanged) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sort = freezed,}) {
  return _then(SearchEventSortChanged(
sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SearchEventCleared implements SearchEvent {
  const SearchEventCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEventCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.cleared()';
}


}




/// @nodoc


class SearchEventTabChanged implements SearchEvent {
  const SearchEventTabChanged({required this.tab});
  

 final  SearchTab tab;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchEventTabChangedCopyWith<SearchEventTabChanged> get copyWith => _$SearchEventTabChangedCopyWithImpl<SearchEventTabChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEventTabChanged&&(identical(other.tab, tab) || other.tab == tab));
}


@override
int get hashCode => Object.hash(runtimeType,tab);

@override
String toString() {
  return 'SearchEvent.tabChanged(tab: $tab)';
}


}

/// @nodoc
abstract mixin class $SearchEventTabChangedCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $SearchEventTabChangedCopyWith(SearchEventTabChanged value, $Res Function(SearchEventTabChanged) _then) = _$SearchEventTabChangedCopyWithImpl;
@useResult
$Res call({
 SearchTab tab
});




}
/// @nodoc
class _$SearchEventTabChangedCopyWithImpl<$Res>
    implements $SearchEventTabChangedCopyWith<$Res> {
  _$SearchEventTabChangedCopyWithImpl(this._self, this._then);

  final SearchEventTabChanged _self;
  final $Res Function(SearchEventTabChanged) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tab = null,}) {
  return _then(SearchEventTabChanged(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as SearchTab,
  ));
}


}

/// @nodoc


class SearchEventKeywordChanged implements SearchEvent {
  const SearchEventKeywordChanged({required this.keyword});
  

 final  String keyword;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchEventKeywordChangedCopyWith<SearchEventKeywordChanged> get copyWith => _$SearchEventKeywordChangedCopyWithImpl<SearchEventKeywordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEventKeywordChanged&&(identical(other.keyword, keyword) || other.keyword == keyword));
}


@override
int get hashCode => Object.hash(runtimeType,keyword);

@override
String toString() {
  return 'SearchEvent.keywordChanged(keyword: $keyword)';
}


}

/// @nodoc
abstract mixin class $SearchEventKeywordChangedCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $SearchEventKeywordChangedCopyWith(SearchEventKeywordChanged value, $Res Function(SearchEventKeywordChanged) _then) = _$SearchEventKeywordChangedCopyWithImpl;
@useResult
$Res call({
 String keyword
});




}
/// @nodoc
class _$SearchEventKeywordChangedCopyWithImpl<$Res>
    implements $SearchEventKeywordChangedCopyWith<$Res> {
  _$SearchEventKeywordChangedCopyWithImpl(this._self, this._then);

  final SearchEventKeywordChanged _self;
  final $Res Function(SearchEventKeywordChanged) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? keyword = null,}) {
  return _then(SearchEventKeywordChanged(
keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

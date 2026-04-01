// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoriesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesEvent()';
}


}

/// @nodoc
class $CategoriesEventCopyWith<$Res>  {
$CategoriesEventCopyWith(CategoriesEvent _, $Res Function(CategoriesEvent) __);
}


/// Adds pattern-matching-related methods to [CategoriesEvent].
extension CategoriesEventPatterns on CategoriesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetCategoriesEvent value)?  getCategories,TResult Function( RefreshCategoriesEvent value)?  refreshCategories,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetCategoriesEvent() when getCategories != null:
return getCategories(_that);case RefreshCategoriesEvent() when refreshCategories != null:
return refreshCategories(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetCategoriesEvent value)  getCategories,required TResult Function( RefreshCategoriesEvent value)  refreshCategories,}){
final _that = this;
switch (_that) {
case GetCategoriesEvent():
return getCategories(_that);case RefreshCategoriesEvent():
return refreshCategories(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetCategoriesEvent value)?  getCategories,TResult? Function( RefreshCategoriesEvent value)?  refreshCategories,}){
final _that = this;
switch (_that) {
case GetCategoriesEvent() when getCategories != null:
return getCategories(_that);case RefreshCategoriesEvent() when refreshCategories != null:
return refreshCategories(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getCategories,TResult Function()?  refreshCategories,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetCategoriesEvent() when getCategories != null:
return getCategories();case RefreshCategoriesEvent() when refreshCategories != null:
return refreshCategories();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getCategories,required TResult Function()  refreshCategories,}) {final _that = this;
switch (_that) {
case GetCategoriesEvent():
return getCategories();case RefreshCategoriesEvent():
return refreshCategories();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getCategories,TResult? Function()?  refreshCategories,}) {final _that = this;
switch (_that) {
case GetCategoriesEvent() when getCategories != null:
return getCategories();case RefreshCategoriesEvent() when refreshCategories != null:
return refreshCategories();case _:
  return null;

}
}

}

/// @nodoc


class GetCategoriesEvent implements CategoriesEvent {
  const GetCategoriesEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCategoriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesEvent.getCategories()';
}


}




/// @nodoc


class RefreshCategoriesEvent implements CategoriesEvent {
  const RefreshCategoriesEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshCategoriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesEvent.refreshCategories()';
}


}




// dart format on

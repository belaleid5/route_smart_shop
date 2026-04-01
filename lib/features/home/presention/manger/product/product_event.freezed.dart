// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsEvent()';
}


}

/// @nodoc
class $ProductsEventCopyWith<$Res>  {
$ProductsEventCopyWith(ProductsEvent _, $Res Function(ProductsEvent) __);
}


/// Adds pattern-matching-related methods to [ProductsEvent].
extension ProductsEventPatterns on ProductsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetProductsEvent value)?  getProducts,TResult Function( RefreshProductsEvent value)?  refreshProducts,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetProductsEvent() when getProducts != null:
return getProducts(_that);case RefreshProductsEvent() when refreshProducts != null:
return refreshProducts(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetProductsEvent value)  getProducts,required TResult Function( RefreshProductsEvent value)  refreshProducts,}){
final _that = this;
switch (_that) {
case GetProductsEvent():
return getProducts(_that);case RefreshProductsEvent():
return refreshProducts(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetProductsEvent value)?  getProducts,TResult? Function( RefreshProductsEvent value)?  refreshProducts,}){
final _that = this;
switch (_that) {
case GetProductsEvent() when getProducts != null:
return getProducts(_that);case RefreshProductsEvent() when refreshProducts != null:
return refreshProducts(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getProducts,TResult Function()?  refreshProducts,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetProductsEvent() when getProducts != null:
return getProducts();case RefreshProductsEvent() when refreshProducts != null:
return refreshProducts();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getProducts,required TResult Function()  refreshProducts,}) {final _that = this;
switch (_that) {
case GetProductsEvent():
return getProducts();case RefreshProductsEvent():
return refreshProducts();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getProducts,TResult? Function()?  refreshProducts,}) {final _that = this;
switch (_that) {
case GetProductsEvent() when getProducts != null:
return getProducts();case RefreshProductsEvent() when refreshProducts != null:
return refreshProducts();case _:
  return null;

}
}

}

/// @nodoc


class GetProductsEvent implements ProductsEvent {
  const GetProductsEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsEvent.getProducts()';
}


}




/// @nodoc


class RefreshProductsEvent implements ProductsEvent {
  const RefreshProductsEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshProductsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsEvent.refreshProducts()';
}


}




// dart format on

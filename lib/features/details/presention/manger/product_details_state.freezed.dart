// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailsState()';
}


}

/// @nodoc
class $ProductDetailsStateCopyWith<$Res>  {
$ProductDetailsStateCopyWith(ProductDetailsState _, $Res Function(ProductDetailsState) __);
}


/// Adds pattern-matching-related methods to [ProductDetailsState].
extension ProductDetailsStatePatterns on ProductDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductDetailsInitial value)?  initial,TResult Function( ProductDetailsLoading value)?  loading,TResult Function( ProductDetailsSuccess value)?  success,TResult Function( ProductDetailsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductDetailsInitial() when initial != null:
return initial(_that);case ProductDetailsLoading() when loading != null:
return loading(_that);case ProductDetailsSuccess() when success != null:
return success(_that);case ProductDetailsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductDetailsInitial value)  initial,required TResult Function( ProductDetailsLoading value)  loading,required TResult Function( ProductDetailsSuccess value)  success,required TResult Function( ProductDetailsError value)  error,}){
final _that = this;
switch (_that) {
case ProductDetailsInitial():
return initial(_that);case ProductDetailsLoading():
return loading(_that);case ProductDetailsSuccess():
return success(_that);case ProductDetailsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductDetailsInitial value)?  initial,TResult? Function( ProductDetailsLoading value)?  loading,TResult? Function( ProductDetailsSuccess value)?  success,TResult? Function( ProductDetailsError value)?  error,}){
final _that = this;
switch (_that) {
case ProductDetailsInitial() when initial != null:
return initial(_that);case ProductDetailsLoading() when loading != null:
return loading(_that);case ProductDetailsSuccess() when success != null:
return success(_that);case ProductDetailsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ProductDetailsDataModel product)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductDetailsInitial() when initial != null:
return initial();case ProductDetailsLoading() when loading != null:
return loading();case ProductDetailsSuccess() when success != null:
return success(_that.product);case ProductDetailsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ProductDetailsDataModel product)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ProductDetailsInitial():
return initial();case ProductDetailsLoading():
return loading();case ProductDetailsSuccess():
return success(_that.product);case ProductDetailsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ProductDetailsDataModel product)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ProductDetailsInitial() when initial != null:
return initial();case ProductDetailsLoading() when loading != null:
return loading();case ProductDetailsSuccess() when success != null:
return success(_that.product);case ProductDetailsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProductDetailsInitial implements ProductDetailsState {
  const ProductDetailsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailsState.initial()';
}


}




/// @nodoc


class ProductDetailsLoading implements ProductDetailsState {
  const ProductDetailsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailsState.loading()';
}


}




/// @nodoc


class ProductDetailsSuccess implements ProductDetailsState {
  const ProductDetailsSuccess(this.product);
  

 final  ProductDetailsDataModel product;

/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailsSuccessCopyWith<ProductDetailsSuccess> get copyWith => _$ProductDetailsSuccessCopyWithImpl<ProductDetailsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailsSuccess&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'ProductDetailsState.success(product: $product)';
}


}

/// @nodoc
abstract mixin class $ProductDetailsSuccessCopyWith<$Res> implements $ProductDetailsStateCopyWith<$Res> {
  factory $ProductDetailsSuccessCopyWith(ProductDetailsSuccess value, $Res Function(ProductDetailsSuccess) _then) = _$ProductDetailsSuccessCopyWithImpl;
@useResult
$Res call({
 ProductDetailsDataModel product
});




}
/// @nodoc
class _$ProductDetailsSuccessCopyWithImpl<$Res>
    implements $ProductDetailsSuccessCopyWith<$Res> {
  _$ProductDetailsSuccessCopyWithImpl(this._self, this._then);

  final ProductDetailsSuccess _self;
  final $Res Function(ProductDetailsSuccess) _then;

/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(ProductDetailsSuccess(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductDetailsDataModel,
  ));
}


}

/// @nodoc


class ProductDetailsError implements ProductDetailsState {
  const ProductDetailsError(this.message);
  

 final  String message;

/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailsErrorCopyWith<ProductDetailsError> get copyWith => _$ProductDetailsErrorCopyWithImpl<ProductDetailsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProductDetailsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProductDetailsErrorCopyWith<$Res> implements $ProductDetailsStateCopyWith<$Res> {
  factory $ProductDetailsErrorCopyWith(ProductDetailsError value, $Res Function(ProductDetailsError) _then) = _$ProductDetailsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProductDetailsErrorCopyWithImpl<$Res>
    implements $ProductDetailsErrorCopyWith<$Res> {
  _$ProductDetailsErrorCopyWithImpl(this._self, this._then);

  final ProductDetailsError _self;
  final $Res Function(ProductDetailsError) _then;

/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProductDetailsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

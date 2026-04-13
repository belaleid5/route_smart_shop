// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState()';
}


}

/// @nodoc
class $CartStateCopyWith<$Res>  {
$CartStateCopyWith(CartState _, $Res Function(CartState) __);
}


/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _GetCartSuccess value)?  getCartSuccess,TResult Function( _AddToCartSuccess value)?  addToCartSuccess,TResult Function( _UpdateQuantitySuccess value)?  updateQuantitySuccess,TResult Function( _RemoveItemSuccess value)?  removeItemSuccess,TResult Function( _ClearCartSuccess value)?  clearCartSuccess,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _GetCartSuccess() when getCartSuccess != null:
return getCartSuccess(_that);case _AddToCartSuccess() when addToCartSuccess != null:
return addToCartSuccess(_that);case _UpdateQuantitySuccess() when updateQuantitySuccess != null:
return updateQuantitySuccess(_that);case _RemoveItemSuccess() when removeItemSuccess != null:
return removeItemSuccess(_that);case _ClearCartSuccess() when clearCartSuccess != null:
return clearCartSuccess(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _GetCartSuccess value)  getCartSuccess,required TResult Function( _AddToCartSuccess value)  addToCartSuccess,required TResult Function( _UpdateQuantitySuccess value)  updateQuantitySuccess,required TResult Function( _RemoveItemSuccess value)  removeItemSuccess,required TResult Function( _ClearCartSuccess value)  clearCartSuccess,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _GetCartSuccess():
return getCartSuccess(_that);case _AddToCartSuccess():
return addToCartSuccess(_that);case _UpdateQuantitySuccess():
return updateQuantitySuccess(_that);case _RemoveItemSuccess():
return removeItemSuccess(_that);case _ClearCartSuccess():
return clearCartSuccess(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _GetCartSuccess value)?  getCartSuccess,TResult? Function( _AddToCartSuccess value)?  addToCartSuccess,TResult? Function( _UpdateQuantitySuccess value)?  updateQuantitySuccess,TResult? Function( _RemoveItemSuccess value)?  removeItemSuccess,TResult? Function( _ClearCartSuccess value)?  clearCartSuccess,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _GetCartSuccess() when getCartSuccess != null:
return getCartSuccess(_that);case _AddToCartSuccess() when addToCartSuccess != null:
return addToCartSuccess(_that);case _UpdateQuantitySuccess() when updateQuantitySuccess != null:
return updateQuantitySuccess(_that);case _RemoveItemSuccess() when removeItemSuccess != null:
return removeItemSuccess(_that);case _ClearCartSuccess() when clearCartSuccess != null:
return clearCartSuccess(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( CartResponseModel cart)?  getCartSuccess,TResult Function( CartResponseModel cart)?  addToCartSuccess,TResult Function( CartResponseModel cart)?  updateQuantitySuccess,TResult Function( CartResponseModel cart)?  removeItemSuccess,TResult Function( MessageResponseModel message)?  clearCartSuccess,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _GetCartSuccess() when getCartSuccess != null:
return getCartSuccess(_that.cart);case _AddToCartSuccess() when addToCartSuccess != null:
return addToCartSuccess(_that.cart);case _UpdateQuantitySuccess() when updateQuantitySuccess != null:
return updateQuantitySuccess(_that.cart);case _RemoveItemSuccess() when removeItemSuccess != null:
return removeItemSuccess(_that.cart);case _ClearCartSuccess() when clearCartSuccess != null:
return clearCartSuccess(_that.message);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( CartResponseModel cart)  getCartSuccess,required TResult Function( CartResponseModel cart)  addToCartSuccess,required TResult Function( CartResponseModel cart)  updateQuantitySuccess,required TResult Function( CartResponseModel cart)  removeItemSuccess,required TResult Function( MessageResponseModel message)  clearCartSuccess,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _GetCartSuccess():
return getCartSuccess(_that.cart);case _AddToCartSuccess():
return addToCartSuccess(_that.cart);case _UpdateQuantitySuccess():
return updateQuantitySuccess(_that.cart);case _RemoveItemSuccess():
return removeItemSuccess(_that.cart);case _ClearCartSuccess():
return clearCartSuccess(_that.message);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( CartResponseModel cart)?  getCartSuccess,TResult? Function( CartResponseModel cart)?  addToCartSuccess,TResult? Function( CartResponseModel cart)?  updateQuantitySuccess,TResult? Function( CartResponseModel cart)?  removeItemSuccess,TResult? Function( MessageResponseModel message)?  clearCartSuccess,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _GetCartSuccess() when getCartSuccess != null:
return getCartSuccess(_that.cart);case _AddToCartSuccess() when addToCartSuccess != null:
return addToCartSuccess(_that.cart);case _UpdateQuantitySuccess() when updateQuantitySuccess != null:
return updateQuantitySuccess(_that.cart);case _RemoveItemSuccess() when removeItemSuccess != null:
return removeItemSuccess(_that.cart);case _ClearCartSuccess() when clearCartSuccess != null:
return clearCartSuccess(_that.message);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CartState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState.initial()';
}


}




/// @nodoc


class _Loading implements CartState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState.loading()';
}


}




/// @nodoc


class _GetCartSuccess implements CartState {
  const _GetCartSuccess(this.cart);
  

 final  CartResponseModel cart;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCartSuccessCopyWith<_GetCartSuccess> get copyWith => __$GetCartSuccessCopyWithImpl<_GetCartSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCartSuccess&&(identical(other.cart, cart) || other.cart == cart));
}


@override
int get hashCode => Object.hash(runtimeType,cart);

@override
String toString() {
  return 'CartState.getCartSuccess(cart: $cart)';
}


}

/// @nodoc
abstract mixin class _$GetCartSuccessCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$GetCartSuccessCopyWith(_GetCartSuccess value, $Res Function(_GetCartSuccess) _then) = __$GetCartSuccessCopyWithImpl;
@useResult
$Res call({
 CartResponseModel cart
});




}
/// @nodoc
class __$GetCartSuccessCopyWithImpl<$Res>
    implements _$GetCartSuccessCopyWith<$Res> {
  __$GetCartSuccessCopyWithImpl(this._self, this._then);

  final _GetCartSuccess _self;
  final $Res Function(_GetCartSuccess) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cart = null,}) {
  return _then(_GetCartSuccess(
null == cart ? _self.cart : cart // ignore: cast_nullable_to_non_nullable
as CartResponseModel,
  ));
}


}

/// @nodoc


class _AddToCartSuccess implements CartState {
  const _AddToCartSuccess(this.cart);
  

 final  CartResponseModel cart;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddToCartSuccessCopyWith<_AddToCartSuccess> get copyWith => __$AddToCartSuccessCopyWithImpl<_AddToCartSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddToCartSuccess&&(identical(other.cart, cart) || other.cart == cart));
}


@override
int get hashCode => Object.hash(runtimeType,cart);

@override
String toString() {
  return 'CartState.addToCartSuccess(cart: $cart)';
}


}

/// @nodoc
abstract mixin class _$AddToCartSuccessCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$AddToCartSuccessCopyWith(_AddToCartSuccess value, $Res Function(_AddToCartSuccess) _then) = __$AddToCartSuccessCopyWithImpl;
@useResult
$Res call({
 CartResponseModel cart
});




}
/// @nodoc
class __$AddToCartSuccessCopyWithImpl<$Res>
    implements _$AddToCartSuccessCopyWith<$Res> {
  __$AddToCartSuccessCopyWithImpl(this._self, this._then);

  final _AddToCartSuccess _self;
  final $Res Function(_AddToCartSuccess) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cart = null,}) {
  return _then(_AddToCartSuccess(
null == cart ? _self.cart : cart // ignore: cast_nullable_to_non_nullable
as CartResponseModel,
  ));
}


}

/// @nodoc


class _UpdateQuantitySuccess implements CartState {
  const _UpdateQuantitySuccess(this.cart);
  

 final  CartResponseModel cart;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateQuantitySuccessCopyWith<_UpdateQuantitySuccess> get copyWith => __$UpdateQuantitySuccessCopyWithImpl<_UpdateQuantitySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateQuantitySuccess&&(identical(other.cart, cart) || other.cart == cart));
}


@override
int get hashCode => Object.hash(runtimeType,cart);

@override
String toString() {
  return 'CartState.updateQuantitySuccess(cart: $cart)';
}


}

/// @nodoc
abstract mixin class _$UpdateQuantitySuccessCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$UpdateQuantitySuccessCopyWith(_UpdateQuantitySuccess value, $Res Function(_UpdateQuantitySuccess) _then) = __$UpdateQuantitySuccessCopyWithImpl;
@useResult
$Res call({
 CartResponseModel cart
});




}
/// @nodoc
class __$UpdateQuantitySuccessCopyWithImpl<$Res>
    implements _$UpdateQuantitySuccessCopyWith<$Res> {
  __$UpdateQuantitySuccessCopyWithImpl(this._self, this._then);

  final _UpdateQuantitySuccess _self;
  final $Res Function(_UpdateQuantitySuccess) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cart = null,}) {
  return _then(_UpdateQuantitySuccess(
null == cart ? _self.cart : cart // ignore: cast_nullable_to_non_nullable
as CartResponseModel,
  ));
}


}

/// @nodoc


class _RemoveItemSuccess implements CartState {
  const _RemoveItemSuccess(this.cart);
  

 final  CartResponseModel cart;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveItemSuccessCopyWith<_RemoveItemSuccess> get copyWith => __$RemoveItemSuccessCopyWithImpl<_RemoveItemSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveItemSuccess&&(identical(other.cart, cart) || other.cart == cart));
}


@override
int get hashCode => Object.hash(runtimeType,cart);

@override
String toString() {
  return 'CartState.removeItemSuccess(cart: $cart)';
}


}

/// @nodoc
abstract mixin class _$RemoveItemSuccessCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$RemoveItemSuccessCopyWith(_RemoveItemSuccess value, $Res Function(_RemoveItemSuccess) _then) = __$RemoveItemSuccessCopyWithImpl;
@useResult
$Res call({
 CartResponseModel cart
});




}
/// @nodoc
class __$RemoveItemSuccessCopyWithImpl<$Res>
    implements _$RemoveItemSuccessCopyWith<$Res> {
  __$RemoveItemSuccessCopyWithImpl(this._self, this._then);

  final _RemoveItemSuccess _self;
  final $Res Function(_RemoveItemSuccess) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cart = null,}) {
  return _then(_RemoveItemSuccess(
null == cart ? _self.cart : cart // ignore: cast_nullable_to_non_nullable
as CartResponseModel,
  ));
}


}

/// @nodoc


class _ClearCartSuccess implements CartState {
  const _ClearCartSuccess(this.message);
  

 final  MessageResponseModel message;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClearCartSuccessCopyWith<_ClearCartSuccess> get copyWith => __$ClearCartSuccessCopyWithImpl<_ClearCartSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearCartSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CartState.clearCartSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ClearCartSuccessCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$ClearCartSuccessCopyWith(_ClearCartSuccess value, $Res Function(_ClearCartSuccess) _then) = __$ClearCartSuccessCopyWithImpl;
@useResult
$Res call({
 MessageResponseModel message
});




}
/// @nodoc
class __$ClearCartSuccessCopyWithImpl<$Res>
    implements _$ClearCartSuccessCopyWith<$Res> {
  __$ClearCartSuccessCopyWithImpl(this._self, this._then);

  final _ClearCartSuccess _self;
  final $Res Function(_ClearCartSuccess) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ClearCartSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as MessageResponseModel,
  ));
}


}

/// @nodoc


class _Error implements CartState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CartState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

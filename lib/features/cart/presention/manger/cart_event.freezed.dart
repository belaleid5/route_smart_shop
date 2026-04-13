// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartEvent()';
}


}

/// @nodoc
class $CartEventCopyWith<$Res>  {
$CartEventCopyWith(CartEvent _, $Res Function(CartEvent) __);
}


/// Adds pattern-matching-related methods to [CartEvent].
extension CartEventPatterns on CartEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetCartEvent value)?  getCart,TResult Function( AddToCartEvent value)?  addToCart,TResult Function( UpdateQuantityEvent value)?  updateQuantity,TResult Function( RemoveItemEvent value)?  removeItem,TResult Function( ClearCartEvent value)?  clearCart,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetCartEvent() when getCart != null:
return getCart(_that);case AddToCartEvent() when addToCart != null:
return addToCart(_that);case UpdateQuantityEvent() when updateQuantity != null:
return updateQuantity(_that);case RemoveItemEvent() when removeItem != null:
return removeItem(_that);case ClearCartEvent() when clearCart != null:
return clearCart(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetCartEvent value)  getCart,required TResult Function( AddToCartEvent value)  addToCart,required TResult Function( UpdateQuantityEvent value)  updateQuantity,required TResult Function( RemoveItemEvent value)  removeItem,required TResult Function( ClearCartEvent value)  clearCart,}){
final _that = this;
switch (_that) {
case GetCartEvent():
return getCart(_that);case AddToCartEvent():
return addToCart(_that);case UpdateQuantityEvent():
return updateQuantity(_that);case RemoveItemEvent():
return removeItem(_that);case ClearCartEvent():
return clearCart(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetCartEvent value)?  getCart,TResult? Function( AddToCartEvent value)?  addToCart,TResult? Function( UpdateQuantityEvent value)?  updateQuantity,TResult? Function( RemoveItemEvent value)?  removeItem,TResult? Function( ClearCartEvent value)?  clearCart,}){
final _that = this;
switch (_that) {
case GetCartEvent() when getCart != null:
return getCart(_that);case AddToCartEvent() when addToCart != null:
return addToCart(_that);case UpdateQuantityEvent() when updateQuantity != null:
return updateQuantity(_that);case RemoveItemEvent() when removeItem != null:
return removeItem(_that);case ClearCartEvent() when clearCart != null:
return clearCart(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getCart,TResult Function( String productId)?  addToCart,TResult Function( String productId,  int count)?  updateQuantity,TResult Function( String productId)?  removeItem,TResult Function()?  clearCart,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetCartEvent() when getCart != null:
return getCart();case AddToCartEvent() when addToCart != null:
return addToCart(_that.productId);case UpdateQuantityEvent() when updateQuantity != null:
return updateQuantity(_that.productId,_that.count);case RemoveItemEvent() when removeItem != null:
return removeItem(_that.productId);case ClearCartEvent() when clearCart != null:
return clearCart();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getCart,required TResult Function( String productId)  addToCart,required TResult Function( String productId,  int count)  updateQuantity,required TResult Function( String productId)  removeItem,required TResult Function()  clearCart,}) {final _that = this;
switch (_that) {
case GetCartEvent():
return getCart();case AddToCartEvent():
return addToCart(_that.productId);case UpdateQuantityEvent():
return updateQuantity(_that.productId,_that.count);case RemoveItemEvent():
return removeItem(_that.productId);case ClearCartEvent():
return clearCart();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getCart,TResult? Function( String productId)?  addToCart,TResult? Function( String productId,  int count)?  updateQuantity,TResult? Function( String productId)?  removeItem,TResult? Function()?  clearCart,}) {final _that = this;
switch (_that) {
case GetCartEvent() when getCart != null:
return getCart();case AddToCartEvent() when addToCart != null:
return addToCart(_that.productId);case UpdateQuantityEvent() when updateQuantity != null:
return updateQuantity(_that.productId,_that.count);case RemoveItemEvent() when removeItem != null:
return removeItem(_that.productId);case ClearCartEvent() when clearCart != null:
return clearCart();case _:
  return null;

}
}

}

/// @nodoc


class GetCartEvent implements CartEvent {
  const GetCartEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCartEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartEvent.getCart()';
}


}




/// @nodoc


class AddToCartEvent implements CartEvent {
  const AddToCartEvent(this.productId);
  

 final  String productId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddToCartEventCopyWith<AddToCartEvent> get copyWith => _$AddToCartEventCopyWithImpl<AddToCartEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddToCartEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'CartEvent.addToCart(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $AddToCartEventCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $AddToCartEventCopyWith(AddToCartEvent value, $Res Function(AddToCartEvent) _then) = _$AddToCartEventCopyWithImpl;
@useResult
$Res call({
 String productId
});




}
/// @nodoc
class _$AddToCartEventCopyWithImpl<$Res>
    implements $AddToCartEventCopyWith<$Res> {
  _$AddToCartEventCopyWithImpl(this._self, this._then);

  final AddToCartEvent _self;
  final $Res Function(AddToCartEvent) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(AddToCartEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateQuantityEvent implements CartEvent {
  const UpdateQuantityEvent(this.productId, this.count);
  

 final  String productId;
 final  int count;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateQuantityEventCopyWith<UpdateQuantityEvent> get copyWith => _$UpdateQuantityEventCopyWithImpl<UpdateQuantityEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateQuantityEvent&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,productId,count);

@override
String toString() {
  return 'CartEvent.updateQuantity(productId: $productId, count: $count)';
}


}

/// @nodoc
abstract mixin class $UpdateQuantityEventCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $UpdateQuantityEventCopyWith(UpdateQuantityEvent value, $Res Function(UpdateQuantityEvent) _then) = _$UpdateQuantityEventCopyWithImpl;
@useResult
$Res call({
 String productId, int count
});




}
/// @nodoc
class _$UpdateQuantityEventCopyWithImpl<$Res>
    implements $UpdateQuantityEventCopyWith<$Res> {
  _$UpdateQuantityEventCopyWithImpl(this._self, this._then);

  final UpdateQuantityEvent _self;
  final $Res Function(UpdateQuantityEvent) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? count = null,}) {
  return _then(UpdateQuantityEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class RemoveItemEvent implements CartEvent {
  const RemoveItemEvent(this.productId);
  

 final  String productId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveItemEventCopyWith<RemoveItemEvent> get copyWith => _$RemoveItemEventCopyWithImpl<RemoveItemEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveItemEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'CartEvent.removeItem(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $RemoveItemEventCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $RemoveItemEventCopyWith(RemoveItemEvent value, $Res Function(RemoveItemEvent) _then) = _$RemoveItemEventCopyWithImpl;
@useResult
$Res call({
 String productId
});




}
/// @nodoc
class _$RemoveItemEventCopyWithImpl<$Res>
    implements $RemoveItemEventCopyWith<$Res> {
  _$RemoveItemEventCopyWithImpl(this._self, this._then);

  final RemoveItemEvent _self;
  final $Res Function(RemoveItemEvent) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(RemoveItemEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearCartEvent implements CartEvent {
  const ClearCartEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearCartEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartEvent.clearCart()';
}


}




// dart format on

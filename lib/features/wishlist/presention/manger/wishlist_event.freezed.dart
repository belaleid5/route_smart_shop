// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WishlistEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WishlistEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WishlistEvent()';
}


}

/// @nodoc
class $WishlistEventCopyWith<$Res>  {
$WishlistEventCopyWith(WishlistEvent _, $Res Function(WishlistEvent) __);
}


/// Adds pattern-matching-related methods to [WishlistEvent].
extension WishlistEventPatterns on WishlistEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetWishlistEvent value)?  getWishlist,TResult Function( AddToWishlistEvent value)?  addToWishlist,TResult Function( RemoveFromWishlistEvent value)?  removeFromWishlist,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetWishlistEvent() when getWishlist != null:
return getWishlist(_that);case AddToWishlistEvent() when addToWishlist != null:
return addToWishlist(_that);case RemoveFromWishlistEvent() when removeFromWishlist != null:
return removeFromWishlist(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetWishlistEvent value)  getWishlist,required TResult Function( AddToWishlistEvent value)  addToWishlist,required TResult Function( RemoveFromWishlistEvent value)  removeFromWishlist,}){
final _that = this;
switch (_that) {
case GetWishlistEvent():
return getWishlist(_that);case AddToWishlistEvent():
return addToWishlist(_that);case RemoveFromWishlistEvent():
return removeFromWishlist(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetWishlistEvent value)?  getWishlist,TResult? Function( AddToWishlistEvent value)?  addToWishlist,TResult? Function( RemoveFromWishlistEvent value)?  removeFromWishlist,}){
final _that = this;
switch (_that) {
case GetWishlistEvent() when getWishlist != null:
return getWishlist(_that);case AddToWishlistEvent() when addToWishlist != null:
return addToWishlist(_that);case RemoveFromWishlistEvent() when removeFromWishlist != null:
return removeFromWishlist(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getWishlist,TResult Function( String productId)?  addToWishlist,TResult Function( String productId)?  removeFromWishlist,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetWishlistEvent() when getWishlist != null:
return getWishlist();case AddToWishlistEvent() when addToWishlist != null:
return addToWishlist(_that.productId);case RemoveFromWishlistEvent() when removeFromWishlist != null:
return removeFromWishlist(_that.productId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getWishlist,required TResult Function( String productId)  addToWishlist,required TResult Function( String productId)  removeFromWishlist,}) {final _that = this;
switch (_that) {
case GetWishlistEvent():
return getWishlist();case AddToWishlistEvent():
return addToWishlist(_that.productId);case RemoveFromWishlistEvent():
return removeFromWishlist(_that.productId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getWishlist,TResult? Function( String productId)?  addToWishlist,TResult? Function( String productId)?  removeFromWishlist,}) {final _that = this;
switch (_that) {
case GetWishlistEvent() when getWishlist != null:
return getWishlist();case AddToWishlistEvent() when addToWishlist != null:
return addToWishlist(_that.productId);case RemoveFromWishlistEvent() when removeFromWishlist != null:
return removeFromWishlist(_that.productId);case _:
  return null;

}
}

}

/// @nodoc


class GetWishlistEvent implements WishlistEvent {
  const GetWishlistEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetWishlistEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WishlistEvent.getWishlist()';
}


}




/// @nodoc


class AddToWishlistEvent implements WishlistEvent {
  const AddToWishlistEvent(this.productId);
  

 final  String productId;

/// Create a copy of WishlistEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddToWishlistEventCopyWith<AddToWishlistEvent> get copyWith => _$AddToWishlistEventCopyWithImpl<AddToWishlistEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddToWishlistEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'WishlistEvent.addToWishlist(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $AddToWishlistEventCopyWith<$Res> implements $WishlistEventCopyWith<$Res> {
  factory $AddToWishlistEventCopyWith(AddToWishlistEvent value, $Res Function(AddToWishlistEvent) _then) = _$AddToWishlistEventCopyWithImpl;
@useResult
$Res call({
 String productId
});




}
/// @nodoc
class _$AddToWishlistEventCopyWithImpl<$Res>
    implements $AddToWishlistEventCopyWith<$Res> {
  _$AddToWishlistEventCopyWithImpl(this._self, this._then);

  final AddToWishlistEvent _self;
  final $Res Function(AddToWishlistEvent) _then;

/// Create a copy of WishlistEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(AddToWishlistEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RemoveFromWishlistEvent implements WishlistEvent {
  const RemoveFromWishlistEvent(this.productId);
  

 final  String productId;

/// Create a copy of WishlistEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveFromWishlistEventCopyWith<RemoveFromWishlistEvent> get copyWith => _$RemoveFromWishlistEventCopyWithImpl<RemoveFromWishlistEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveFromWishlistEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'WishlistEvent.removeFromWishlist(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $RemoveFromWishlistEventCopyWith<$Res> implements $WishlistEventCopyWith<$Res> {
  factory $RemoveFromWishlistEventCopyWith(RemoveFromWishlistEvent value, $Res Function(RemoveFromWishlistEvent) _then) = _$RemoveFromWishlistEventCopyWithImpl;
@useResult
$Res call({
 String productId
});




}
/// @nodoc
class _$RemoveFromWishlistEventCopyWithImpl<$Res>
    implements $RemoveFromWishlistEventCopyWith<$Res> {
  _$RemoveFromWishlistEventCopyWithImpl(this._self, this._then);

  final RemoveFromWishlistEvent _self;
  final $Res Function(RemoveFromWishlistEvent) _then;

/// Create a copy of WishlistEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(RemoveFromWishlistEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

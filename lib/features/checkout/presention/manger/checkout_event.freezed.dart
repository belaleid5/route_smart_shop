// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutEvent()';
}


}

/// @nodoc
class $CheckoutEventCopyWith<$Res>  {
$CheckoutEventCopyWith(CheckoutEvent _, $Res Function(CheckoutEvent) __);
}


/// Adds pattern-matching-related methods to [CheckoutEvent].
extension CheckoutEventPatterns on CheckoutEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetAddressesEvent value)?  getAddresses,TResult Function( AddAddressEvent value)?  addAddress,TResult Function( RemoveAddressEvent value)?  removeAddress,TResult Function( CreateCashOrderEvent value)?  createCashOrder,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetAddressesEvent() when getAddresses != null:
return getAddresses(_that);case AddAddressEvent() when addAddress != null:
return addAddress(_that);case RemoveAddressEvent() when removeAddress != null:
return removeAddress(_that);case CreateCashOrderEvent() when createCashOrder != null:
return createCashOrder(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetAddressesEvent value)  getAddresses,required TResult Function( AddAddressEvent value)  addAddress,required TResult Function( RemoveAddressEvent value)  removeAddress,required TResult Function( CreateCashOrderEvent value)  createCashOrder,}){
final _that = this;
switch (_that) {
case GetAddressesEvent():
return getAddresses(_that);case AddAddressEvent():
return addAddress(_that);case RemoveAddressEvent():
return removeAddress(_that);case CreateCashOrderEvent():
return createCashOrder(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetAddressesEvent value)?  getAddresses,TResult? Function( AddAddressEvent value)?  addAddress,TResult? Function( RemoveAddressEvent value)?  removeAddress,TResult? Function( CreateCashOrderEvent value)?  createCashOrder,}){
final _that = this;
switch (_that) {
case GetAddressesEvent() when getAddresses != null:
return getAddresses(_that);case AddAddressEvent() when addAddress != null:
return addAddress(_that);case RemoveAddressEvent() when removeAddress != null:
return removeAddress(_that);case CreateCashOrderEvent() when createCashOrder != null:
return createCashOrder(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getAddresses,TResult Function( AddressModel address)?  addAddress,TResult Function( String addressId)?  removeAddress,TResult Function( String cartId,  ShippingAddressModel shippingAddress)?  createCashOrder,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetAddressesEvent() when getAddresses != null:
return getAddresses();case AddAddressEvent() when addAddress != null:
return addAddress(_that.address);case RemoveAddressEvent() when removeAddress != null:
return removeAddress(_that.addressId);case CreateCashOrderEvent() when createCashOrder != null:
return createCashOrder(_that.cartId,_that.shippingAddress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getAddresses,required TResult Function( AddressModel address)  addAddress,required TResult Function( String addressId)  removeAddress,required TResult Function( String cartId,  ShippingAddressModel shippingAddress)  createCashOrder,}) {final _that = this;
switch (_that) {
case GetAddressesEvent():
return getAddresses();case AddAddressEvent():
return addAddress(_that.address);case RemoveAddressEvent():
return removeAddress(_that.addressId);case CreateCashOrderEvent():
return createCashOrder(_that.cartId,_that.shippingAddress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getAddresses,TResult? Function( AddressModel address)?  addAddress,TResult? Function( String addressId)?  removeAddress,TResult? Function( String cartId,  ShippingAddressModel shippingAddress)?  createCashOrder,}) {final _that = this;
switch (_that) {
case GetAddressesEvent() when getAddresses != null:
return getAddresses();case AddAddressEvent() when addAddress != null:
return addAddress(_that.address);case RemoveAddressEvent() when removeAddress != null:
return removeAddress(_that.addressId);case CreateCashOrderEvent() when createCashOrder != null:
return createCashOrder(_that.cartId,_that.shippingAddress);case _:
  return null;

}
}

}

/// @nodoc


class GetAddressesEvent implements CheckoutEvent {
  const GetAddressesEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAddressesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutEvent.getAddresses()';
}


}




/// @nodoc


class AddAddressEvent implements CheckoutEvent {
  const AddAddressEvent(this.address);
  

 final  AddressModel address;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddAddressEventCopyWith<AddAddressEvent> get copyWith => _$AddAddressEventCopyWithImpl<AddAddressEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddAddressEvent&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,address);

@override
String toString() {
  return 'CheckoutEvent.addAddress(address: $address)';
}


}

/// @nodoc
abstract mixin class $AddAddressEventCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory $AddAddressEventCopyWith(AddAddressEvent value, $Res Function(AddAddressEvent) _then) = _$AddAddressEventCopyWithImpl;
@useResult
$Res call({
 AddressModel address
});




}
/// @nodoc
class _$AddAddressEventCopyWithImpl<$Res>
    implements $AddAddressEventCopyWith<$Res> {
  _$AddAddressEventCopyWithImpl(this._self, this._then);

  final AddAddressEvent _self;
  final $Res Function(AddAddressEvent) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? address = null,}) {
  return _then(AddAddressEvent(
null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressModel,
  ));
}


}

/// @nodoc


class RemoveAddressEvent implements CheckoutEvent {
  const RemoveAddressEvent(this.addressId);
  

 final  String addressId;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveAddressEventCopyWith<RemoveAddressEvent> get copyWith => _$RemoveAddressEventCopyWithImpl<RemoveAddressEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveAddressEvent&&(identical(other.addressId, addressId) || other.addressId == addressId));
}


@override
int get hashCode => Object.hash(runtimeType,addressId);

@override
String toString() {
  return 'CheckoutEvent.removeAddress(addressId: $addressId)';
}


}

/// @nodoc
abstract mixin class $RemoveAddressEventCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory $RemoveAddressEventCopyWith(RemoveAddressEvent value, $Res Function(RemoveAddressEvent) _then) = _$RemoveAddressEventCopyWithImpl;
@useResult
$Res call({
 String addressId
});




}
/// @nodoc
class _$RemoveAddressEventCopyWithImpl<$Res>
    implements $RemoveAddressEventCopyWith<$Res> {
  _$RemoveAddressEventCopyWithImpl(this._self, this._then);

  final RemoveAddressEvent _self;
  final $Res Function(RemoveAddressEvent) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? addressId = null,}) {
  return _then(RemoveAddressEvent(
null == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreateCashOrderEvent implements CheckoutEvent {
  const CreateCashOrderEvent({required this.cartId, required this.shippingAddress});
  

 final  String cartId;
 final  ShippingAddressModel shippingAddress;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCashOrderEventCopyWith<CreateCashOrderEvent> get copyWith => _$CreateCashOrderEventCopyWithImpl<CreateCashOrderEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCashOrderEvent&&(identical(other.cartId, cartId) || other.cartId == cartId)&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress));
}


@override
int get hashCode => Object.hash(runtimeType,cartId,shippingAddress);

@override
String toString() {
  return 'CheckoutEvent.createCashOrder(cartId: $cartId, shippingAddress: $shippingAddress)';
}


}

/// @nodoc
abstract mixin class $CreateCashOrderEventCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory $CreateCashOrderEventCopyWith(CreateCashOrderEvent value, $Res Function(CreateCashOrderEvent) _then) = _$CreateCashOrderEventCopyWithImpl;
@useResult
$Res call({
 String cartId, ShippingAddressModel shippingAddress
});




}
/// @nodoc
class _$CreateCashOrderEventCopyWithImpl<$Res>
    implements $CreateCashOrderEventCopyWith<$Res> {
  _$CreateCashOrderEventCopyWithImpl(this._self, this._then);

  final CreateCashOrderEvent _self;
  final $Res Function(CreateCashOrderEvent) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cartId = null,Object? shippingAddress = null,}) {
  return _then(CreateCashOrderEvent(
cartId: null == cartId ? _self.cartId : cartId // ignore: cast_nullable_to_non_nullable
as String,shippingAddress: null == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as ShippingAddressModel,
  ));
}


}

// dart format on

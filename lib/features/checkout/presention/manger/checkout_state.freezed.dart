// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState()';
}


}

/// @nodoc
class $CheckoutStateCopyWith<$Res>  {
$CheckoutStateCopyWith(CheckoutState _, $Res Function(CheckoutState) __);
}


/// Adds pattern-matching-related methods to [CheckoutState].
extension CheckoutStatePatterns on CheckoutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _AddressesLoaded value)?  addressesLoaded,TResult Function( _OrderCreated value)?  orderCreated,TResult Function( _ProcessingPayment value)?  processingPayment,TResult Function( _PaymentSuccess value)?  paymentSuccess,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _AddressesLoaded() when addressesLoaded != null:
return addressesLoaded(_that);case _OrderCreated() when orderCreated != null:
return orderCreated(_that);case _ProcessingPayment() when processingPayment != null:
return processingPayment(_that);case _PaymentSuccess() when paymentSuccess != null:
return paymentSuccess(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _AddressesLoaded value)  addressesLoaded,required TResult Function( _OrderCreated value)  orderCreated,required TResult Function( _ProcessingPayment value)  processingPayment,required TResult Function( _PaymentSuccess value)  paymentSuccess,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _AddressesLoaded():
return addressesLoaded(_that);case _OrderCreated():
return orderCreated(_that);case _ProcessingPayment():
return processingPayment(_that);case _PaymentSuccess():
return paymentSuccess(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _AddressesLoaded value)?  addressesLoaded,TResult? Function( _OrderCreated value)?  orderCreated,TResult? Function( _ProcessingPayment value)?  processingPayment,TResult? Function( _PaymentSuccess value)?  paymentSuccess,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _AddressesLoaded() when addressesLoaded != null:
return addressesLoaded(_that);case _OrderCreated() when orderCreated != null:
return orderCreated(_that);case _ProcessingPayment() when processingPayment != null:
return processingPayment(_that);case _PaymentSuccess() when paymentSuccess != null:
return paymentSuccess(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<AddressModel> addresses)?  addressesLoaded,TResult Function( OrderResponseModel order)?  orderCreated,TResult Function()?  processingPayment,TResult Function()?  paymentSuccess,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _AddressesLoaded() when addressesLoaded != null:
return addressesLoaded(_that.addresses);case _OrderCreated() when orderCreated != null:
return orderCreated(_that.order);case _ProcessingPayment() when processingPayment != null:
return processingPayment();case _PaymentSuccess() when paymentSuccess != null:
return paymentSuccess();case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<AddressModel> addresses)  addressesLoaded,required TResult Function( OrderResponseModel order)  orderCreated,required TResult Function()  processingPayment,required TResult Function()  paymentSuccess,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _AddressesLoaded():
return addressesLoaded(_that.addresses);case _OrderCreated():
return orderCreated(_that.order);case _ProcessingPayment():
return processingPayment();case _PaymentSuccess():
return paymentSuccess();case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<AddressModel> addresses)?  addressesLoaded,TResult? Function( OrderResponseModel order)?  orderCreated,TResult? Function()?  processingPayment,TResult? Function()?  paymentSuccess,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _AddressesLoaded() when addressesLoaded != null:
return addressesLoaded(_that.addresses);case _OrderCreated() when orderCreated != null:
return orderCreated(_that.order);case _ProcessingPayment() when processingPayment != null:
return processingPayment();case _PaymentSuccess() when paymentSuccess != null:
return paymentSuccess();case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CheckoutState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState.initial()';
}


}




/// @nodoc


class _Loading implements CheckoutState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState.loading()';
}


}




/// @nodoc


class _AddressesLoaded implements CheckoutState {
  const _AddressesLoaded(final  List<AddressModel> addresses): _addresses = addresses;
  

 final  List<AddressModel> _addresses;
 List<AddressModel> get addresses {
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addresses);
}


/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressesLoadedCopyWith<_AddressesLoaded> get copyWith => __$AddressesLoadedCopyWithImpl<_AddressesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressesLoaded&&const DeepCollectionEquality().equals(other._addresses, _addresses));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_addresses));

@override
String toString() {
  return 'CheckoutState.addressesLoaded(addresses: $addresses)';
}


}

/// @nodoc
abstract mixin class _$AddressesLoadedCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$AddressesLoadedCopyWith(_AddressesLoaded value, $Res Function(_AddressesLoaded) _then) = __$AddressesLoadedCopyWithImpl;
@useResult
$Res call({
 List<AddressModel> addresses
});




}
/// @nodoc
class __$AddressesLoadedCopyWithImpl<$Res>
    implements _$AddressesLoadedCopyWith<$Res> {
  __$AddressesLoadedCopyWithImpl(this._self, this._then);

  final _AddressesLoaded _self;
  final $Res Function(_AddressesLoaded) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? addresses = null,}) {
  return _then(_AddressesLoaded(
null == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<AddressModel>,
  ));
}


}

/// @nodoc


class _OrderCreated implements CheckoutState {
  const _OrderCreated(this.order);
  

 final  OrderResponseModel order;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCreatedCopyWith<_OrderCreated> get copyWith => __$OrderCreatedCopyWithImpl<_OrderCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderCreated&&(identical(other.order, order) || other.order == order));
}


@override
int get hashCode => Object.hash(runtimeType,order);

@override
String toString() {
  return 'CheckoutState.orderCreated(order: $order)';
}


}

/// @nodoc
abstract mixin class _$OrderCreatedCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$OrderCreatedCopyWith(_OrderCreated value, $Res Function(_OrderCreated) _then) = __$OrderCreatedCopyWithImpl;
@useResult
$Res call({
 OrderResponseModel order
});




}
/// @nodoc
class __$OrderCreatedCopyWithImpl<$Res>
    implements _$OrderCreatedCopyWith<$Res> {
  __$OrderCreatedCopyWithImpl(this._self, this._then);

  final _OrderCreated _self;
  final $Res Function(_OrderCreated) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? order = null,}) {
  return _then(_OrderCreated(
null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as OrderResponseModel,
  ));
}


}

/// @nodoc


class _ProcessingPayment implements CheckoutState {
  const _ProcessingPayment();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessingPayment);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState.processingPayment()';
}


}




/// @nodoc


class _PaymentSuccess implements CheckoutState {
  const _PaymentSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState.paymentSuccess()';
}


}




/// @nodoc


class _Error implements CheckoutState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of CheckoutState
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
  return 'CheckoutState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
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

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

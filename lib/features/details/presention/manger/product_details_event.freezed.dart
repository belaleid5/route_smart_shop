// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductDetailsEvent {

 String get productId;
/// Create a copy of ProductDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailsEventCopyWith<ProductDetailsEvent> get copyWith => _$ProductDetailsEventCopyWithImpl<ProductDetailsEvent>(this as ProductDetailsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailsEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'ProductDetailsEvent(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $ProductDetailsEventCopyWith<$Res>  {
  factory $ProductDetailsEventCopyWith(ProductDetailsEvent value, $Res Function(ProductDetailsEvent) _then) = _$ProductDetailsEventCopyWithImpl;
@useResult
$Res call({
 String productId
});




}
/// @nodoc
class _$ProductDetailsEventCopyWithImpl<$Res>
    implements $ProductDetailsEventCopyWith<$Res> {
  _$ProductDetailsEventCopyWithImpl(this._self, this._then);

  final ProductDetailsEvent _self;
  final $Res Function(ProductDetailsEvent) _then;

/// Create a copy of ProductDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDetailsEvent].
extension ProductDetailsEventPatterns on ProductDetailsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetProductDetailsEvent value)?  getProductDetails,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetProductDetailsEvent() when getProductDetails != null:
return getProductDetails(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetProductDetailsEvent value)  getProductDetails,}){
final _that = this;
switch (_that) {
case GetProductDetailsEvent():
return getProductDetails(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetProductDetailsEvent value)?  getProductDetails,}){
final _that = this;
switch (_that) {
case GetProductDetailsEvent() when getProductDetails != null:
return getProductDetails(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String productId)?  getProductDetails,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetProductDetailsEvent() when getProductDetails != null:
return getProductDetails(_that.productId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String productId)  getProductDetails,}) {final _that = this;
switch (_that) {
case GetProductDetailsEvent():
return getProductDetails(_that.productId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String productId)?  getProductDetails,}) {final _that = this;
switch (_that) {
case GetProductDetailsEvent() when getProductDetails != null:
return getProductDetails(_that.productId);case _:
  return null;

}
}

}

/// @nodoc


class GetProductDetailsEvent implements ProductDetailsEvent {
  const GetProductDetailsEvent(this.productId);
  

@override final  String productId;

/// Create a copy of ProductDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProductDetailsEventCopyWith<GetProductDetailsEvent> get copyWith => _$GetProductDetailsEventCopyWithImpl<GetProductDetailsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductDetailsEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'ProductDetailsEvent.getProductDetails(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $GetProductDetailsEventCopyWith<$Res> implements $ProductDetailsEventCopyWith<$Res> {
  factory $GetProductDetailsEventCopyWith(GetProductDetailsEvent value, $Res Function(GetProductDetailsEvent) _then) = _$GetProductDetailsEventCopyWithImpl;
@override @useResult
$Res call({
 String productId
});




}
/// @nodoc
class _$GetProductDetailsEventCopyWithImpl<$Res>
    implements $GetProductDetailsEventCopyWith<$Res> {
  _$GetProductDetailsEventCopyWithImpl(this._self, this._then);

  final GetProductDetailsEvent _self;
  final $Res Function(GetProductDetailsEvent) _then;

/// Create a copy of ProductDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(GetProductDetailsEvent(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

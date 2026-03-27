// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_code_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyCodeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyCodeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyCodeEvent()';
}


}

/// @nodoc
class $VerifyCodeEventCopyWith<$Res>  {
$VerifyCodeEventCopyWith(VerifyCodeEvent _, $Res Function(VerifyCodeEvent) __);
}


/// Adds pattern-matching-related methods to [VerifyCodeEvent].
extension VerifyCodeEventPatterns on VerifyCodeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( VerifyCodeSubmitted value)?  verifyCodeSubmitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case VerifyCodeSubmitted() when verifyCodeSubmitted != null:
return verifyCodeSubmitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( VerifyCodeSubmitted value)  verifyCodeSubmitted,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case VerifyCodeSubmitted():
return verifyCodeSubmitted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( VerifyCodeSubmitted value)?  verifyCodeSubmitted,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case VerifyCodeSubmitted() when verifyCodeSubmitted != null:
return verifyCodeSubmitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( VerificationCodeRequestModel VerifyCodeRequest)?  verifyCodeSubmitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case VerifyCodeSubmitted() when verifyCodeSubmitted != null:
return verifyCodeSubmitted(_that.VerifyCodeRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( VerificationCodeRequestModel VerifyCodeRequest)  verifyCodeSubmitted,}) {final _that = this;
switch (_that) {
case _Started():
return started();case VerifyCodeSubmitted():
return verifyCodeSubmitted(_that.VerifyCodeRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( VerificationCodeRequestModel VerifyCodeRequest)?  verifyCodeSubmitted,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case VerifyCodeSubmitted() when verifyCodeSubmitted != null:
return verifyCodeSubmitted(_that.VerifyCodeRequest);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements VerifyCodeEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyCodeEvent.started()';
}


}




/// @nodoc


class VerifyCodeSubmitted implements VerifyCodeEvent {
  const VerifyCodeSubmitted(this.VerifyCodeRequest);
  

 final  VerificationCodeRequestModel VerifyCodeRequest;

/// Create a copy of VerifyCodeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyCodeSubmittedCopyWith<VerifyCodeSubmitted> get copyWith => _$VerifyCodeSubmittedCopyWithImpl<VerifyCodeSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyCodeSubmitted&&(identical(other.VerifyCodeRequest, VerifyCodeRequest) || other.VerifyCodeRequest == VerifyCodeRequest));
}


@override
int get hashCode => Object.hash(runtimeType,VerifyCodeRequest);

@override
String toString() {
  return 'VerifyCodeEvent.verifyCodeSubmitted(VerifyCodeRequest: $VerifyCodeRequest)';
}


}

/// @nodoc
abstract mixin class $VerifyCodeSubmittedCopyWith<$Res> implements $VerifyCodeEventCopyWith<$Res> {
  factory $VerifyCodeSubmittedCopyWith(VerifyCodeSubmitted value, $Res Function(VerifyCodeSubmitted) _then) = _$VerifyCodeSubmittedCopyWithImpl;
@useResult
$Res call({
 VerificationCodeRequestModel VerifyCodeRequest
});




}
/// @nodoc
class _$VerifyCodeSubmittedCopyWithImpl<$Res>
    implements $VerifyCodeSubmittedCopyWith<$Res> {
  _$VerifyCodeSubmittedCopyWithImpl(this._self, this._then);

  final VerifyCodeSubmitted _self;
  final $Res Function(VerifyCodeSubmitted) _then;

/// Create a copy of VerifyCodeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? VerifyCodeRequest = null,}) {
  return _then(VerifyCodeSubmitted(
null == VerifyCodeRequest ? _self.VerifyCodeRequest : VerifyCodeRequest // ignore: cast_nullable_to_non_nullable
as VerificationCodeRequestModel,
  ));
}


}

// dart format on

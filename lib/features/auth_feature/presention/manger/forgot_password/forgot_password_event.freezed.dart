// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgotPasswordEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordEvent()';
}


}

/// @nodoc
class $ForgotPasswordEventCopyWith<$Res>  {
$ForgotPasswordEventCopyWith(ForgotPasswordEvent _, $Res Function(ForgotPasswordEvent) __);
}


/// Adds pattern-matching-related methods to [ForgotPasswordEvent].
extension ForgotPasswordEventPatterns on ForgotPasswordEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( ForgotPasswordSubmitted value)?  forgotPasswordSubmitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case ForgotPasswordSubmitted() when forgotPasswordSubmitted != null:
return forgotPasswordSubmitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( ForgotPasswordSubmitted value)  forgotPasswordSubmitted,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case ForgotPasswordSubmitted():
return forgotPasswordSubmitted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( ForgotPasswordSubmitted value)?  forgotPasswordSubmitted,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case ForgotPasswordSubmitted() when forgotPasswordSubmitted != null:
return forgotPasswordSubmitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( ForgotPasswordRequestModel forgotPasswordRequest)?  forgotPasswordSubmitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case ForgotPasswordSubmitted() when forgotPasswordSubmitted != null:
return forgotPasswordSubmitted(_that.forgotPasswordRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( ForgotPasswordRequestModel forgotPasswordRequest)  forgotPasswordSubmitted,}) {final _that = this;
switch (_that) {
case _Started():
return started();case ForgotPasswordSubmitted():
return forgotPasswordSubmitted(_that.forgotPasswordRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( ForgotPasswordRequestModel forgotPasswordRequest)?  forgotPasswordSubmitted,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case ForgotPasswordSubmitted() when forgotPasswordSubmitted != null:
return forgotPasswordSubmitted(_that.forgotPasswordRequest);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ForgotPasswordEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordEvent.started()';
}


}




/// @nodoc


class ForgotPasswordSubmitted implements ForgotPasswordEvent {
  const ForgotPasswordSubmitted(this.forgotPasswordRequest);
  

 final  ForgotPasswordRequestModel forgotPasswordRequest;

/// Create a copy of ForgotPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordSubmittedCopyWith<ForgotPasswordSubmitted> get copyWith => _$ForgotPasswordSubmittedCopyWithImpl<ForgotPasswordSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordSubmitted&&(identical(other.forgotPasswordRequest, forgotPasswordRequest) || other.forgotPasswordRequest == forgotPasswordRequest));
}


@override
int get hashCode => Object.hash(runtimeType,forgotPasswordRequest);

@override
String toString() {
  return 'ForgotPasswordEvent.forgotPasswordSubmitted(forgotPasswordRequest: $forgotPasswordRequest)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordSubmittedCopyWith<$Res> implements $ForgotPasswordEventCopyWith<$Res> {
  factory $ForgotPasswordSubmittedCopyWith(ForgotPasswordSubmitted value, $Res Function(ForgotPasswordSubmitted) _then) = _$ForgotPasswordSubmittedCopyWithImpl;
@useResult
$Res call({
 ForgotPasswordRequestModel forgotPasswordRequest
});




}
/// @nodoc
class _$ForgotPasswordSubmittedCopyWithImpl<$Res>
    implements $ForgotPasswordSubmittedCopyWith<$Res> {
  _$ForgotPasswordSubmittedCopyWithImpl(this._self, this._then);

  final ForgotPasswordSubmitted _self;
  final $Res Function(ForgotPasswordSubmitted) _then;

/// Create a copy of ForgotPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? forgotPasswordRequest = null,}) {
  return _then(ForgotPasswordSubmitted(
null == forgotPasswordRequest ? _self.forgotPasswordRequest : forgotPasswordRequest // ignore: cast_nullable_to_non_nullable
as ForgotPasswordRequestModel,
  ));
}


}

// dart format on

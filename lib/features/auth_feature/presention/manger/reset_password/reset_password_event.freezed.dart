// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResetPasswordEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResetPasswordEvent()';
}


}

/// @nodoc
class $ResetPasswordEventCopyWith<$Res>  {
$ResetPasswordEventCopyWith(ResetPasswordEvent _, $Res Function(ResetPasswordEvent) __);
}


/// Adds pattern-matching-related methods to [ResetPasswordEvent].
extension ResetPasswordEventPatterns on ResetPasswordEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( ResetPasswordSubmitted value)?  resetPasswordSubmitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case ResetPasswordSubmitted() when resetPasswordSubmitted != null:
return resetPasswordSubmitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( ResetPasswordSubmitted value)  resetPasswordSubmitted,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case ResetPasswordSubmitted():
return resetPasswordSubmitted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( ResetPasswordSubmitted value)?  resetPasswordSubmitted,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case ResetPasswordSubmitted() when resetPasswordSubmitted != null:
return resetPasswordSubmitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( ResetPasswordRequestModel resetPasswordRequest)?  resetPasswordSubmitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case ResetPasswordSubmitted() when resetPasswordSubmitted != null:
return resetPasswordSubmitted(_that.resetPasswordRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( ResetPasswordRequestModel resetPasswordRequest)  resetPasswordSubmitted,}) {final _that = this;
switch (_that) {
case _Started():
return started();case ResetPasswordSubmitted():
return resetPasswordSubmitted(_that.resetPasswordRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( ResetPasswordRequestModel resetPasswordRequest)?  resetPasswordSubmitted,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case ResetPasswordSubmitted() when resetPasswordSubmitted != null:
return resetPasswordSubmitted(_that.resetPasswordRequest);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ResetPasswordEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResetPasswordEvent.started()';
}


}




/// @nodoc


class ResetPasswordSubmitted implements ResetPasswordEvent {
  const ResetPasswordSubmitted(this.resetPasswordRequest);
  

 final  ResetPasswordRequestModel resetPasswordRequest;

/// Create a copy of ResetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordSubmittedCopyWith<ResetPasswordSubmitted> get copyWith => _$ResetPasswordSubmittedCopyWithImpl<ResetPasswordSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordSubmitted&&(identical(other.resetPasswordRequest, resetPasswordRequest) || other.resetPasswordRequest == resetPasswordRequest));
}


@override
int get hashCode => Object.hash(runtimeType,resetPasswordRequest);

@override
String toString() {
  return 'ResetPasswordEvent.resetPasswordSubmitted(resetPasswordRequest: $resetPasswordRequest)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordSubmittedCopyWith<$Res> implements $ResetPasswordEventCopyWith<$Res> {
  factory $ResetPasswordSubmittedCopyWith(ResetPasswordSubmitted value, $Res Function(ResetPasswordSubmitted) _then) = _$ResetPasswordSubmittedCopyWithImpl;
@useResult
$Res call({
 ResetPasswordRequestModel resetPasswordRequest
});




}
/// @nodoc
class _$ResetPasswordSubmittedCopyWithImpl<$Res>
    implements $ResetPasswordSubmittedCopyWith<$Res> {
  _$ResetPasswordSubmittedCopyWithImpl(this._self, this._then);

  final ResetPasswordSubmitted _self;
  final $Res Function(ResetPasswordSubmitted) _then;

/// Create a copy of ResetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resetPasswordRequest = null,}) {
  return _then(ResetPasswordSubmitted(
null == resetPasswordRequest ? _self.resetPasswordRequest : resetPasswordRequest // ignore: cast_nullable_to_non_nullable
as ResetPasswordRequestModel,
  ));
}


}

// dart format on

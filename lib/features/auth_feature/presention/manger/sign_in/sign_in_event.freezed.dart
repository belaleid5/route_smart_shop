// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignInEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInEvent()';
}


}

/// @nodoc
class $SignInEventCopyWith<$Res>  {
$SignInEventCopyWith(SignInEvent _, $Res Function(SignInEvent) __);
}


/// Adds pattern-matching-related methods to [SignInEvent].
extension SignInEventPatterns on SignInEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( SignInSubmitted value)?  signInSubmitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case SignInSubmitted() when signInSubmitted != null:
return signInSubmitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( SignInSubmitted value)  signInSubmitted,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case SignInSubmitted():
return signInSubmitted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( SignInSubmitted value)?  signInSubmitted,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case SignInSubmitted() when signInSubmitted != null:
return signInSubmitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( SignInRequestModel signInRequest)?  signInSubmitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case SignInSubmitted() when signInSubmitted != null:
return signInSubmitted(_that.signInRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( SignInRequestModel signInRequest)  signInSubmitted,}) {final _that = this;
switch (_that) {
case _Started():
return started();case SignInSubmitted():
return signInSubmitted(_that.signInRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( SignInRequestModel signInRequest)?  signInSubmitted,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case SignInSubmitted() when signInSubmitted != null:
return signInSubmitted(_that.signInRequest);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements SignInEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInEvent.started()';
}


}




/// @nodoc


class SignInSubmitted implements SignInEvent {
  const SignInSubmitted(this.signInRequest);
  

 final  SignInRequestModel signInRequest;

/// Create a copy of SignInEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInSubmittedCopyWith<SignInSubmitted> get copyWith => _$SignInSubmittedCopyWithImpl<SignInSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInSubmitted&&(identical(other.signInRequest, signInRequest) || other.signInRequest == signInRequest));
}


@override
int get hashCode => Object.hash(runtimeType,signInRequest);

@override
String toString() {
  return 'SignInEvent.signInSubmitted(signInRequest: $signInRequest)';
}


}

/// @nodoc
abstract mixin class $SignInSubmittedCopyWith<$Res> implements $SignInEventCopyWith<$Res> {
  factory $SignInSubmittedCopyWith(SignInSubmitted value, $Res Function(SignInSubmitted) _then) = _$SignInSubmittedCopyWithImpl;
@useResult
$Res call({
 SignInRequestModel signInRequest
});




}
/// @nodoc
class _$SignInSubmittedCopyWithImpl<$Res>
    implements $SignInSubmittedCopyWith<$Res> {
  _$SignInSubmittedCopyWithImpl(this._self, this._then);

  final SignInSubmitted _self;
  final $Res Function(SignInSubmitted) _then;

/// Create a copy of SignInEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? signInRequest = null,}) {
  return _then(SignInSubmitted(
null == signInRequest ? _self.signInRequest : signInRequest // ignore: cast_nullable_to_non_nullable
as SignInRequestModel,
  ));
}


}

// dart format on

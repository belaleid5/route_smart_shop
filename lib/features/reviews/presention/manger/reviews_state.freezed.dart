// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reviews_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReviewsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReviewsState()';
}


}

/// @nodoc
class $ReviewsStateCopyWith<$Res>  {
$ReviewsStateCopyWith(ReviewsState _, $Res Function(ReviewsState) __);
}


/// Adds pattern-matching-related methods to [ReviewsState].
extension ReviewsStatePatterns on ReviewsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,TResult Function( _ActionLoading value)?  actionLoading,TResult Function( _ReviewCreated value)?  reviewCreated,TResult Function( _ReviewUpdated value)?  reviewUpdated,TResult Function( _ReviewDeleted value)?  reviewDeleted,TResult Function( _ActionError value)?  actionError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _ActionLoading() when actionLoading != null:
return actionLoading(_that);case _ReviewCreated() when reviewCreated != null:
return reviewCreated(_that);case _ReviewUpdated() when reviewUpdated != null:
return reviewUpdated(_that);case _ReviewDeleted() when reviewDeleted != null:
return reviewDeleted(_that);case _ActionError() when actionError != null:
return actionError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,required TResult Function( _ActionLoading value)  actionLoading,required TResult Function( _ReviewCreated value)  reviewCreated,required TResult Function( _ReviewUpdated value)  reviewUpdated,required TResult Function( _ReviewDeleted value)  reviewDeleted,required TResult Function( _ActionError value)  actionError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Error():
return error(_that);case _ActionLoading():
return actionLoading(_that);case _ReviewCreated():
return reviewCreated(_that);case _ReviewUpdated():
return reviewUpdated(_that);case _ReviewDeleted():
return reviewDeleted(_that);case _ActionError():
return actionError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,TResult? Function( _ActionLoading value)?  actionLoading,TResult? Function( _ReviewCreated value)?  reviewCreated,TResult? Function( _ReviewUpdated value)?  reviewUpdated,TResult? Function( _ReviewDeleted value)?  reviewDeleted,TResult? Function( _ActionError value)?  actionError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _ActionLoading() when actionLoading != null:
return actionLoading(_that);case _ReviewCreated() when reviewCreated != null:
return reviewCreated(_that);case _ReviewUpdated() when reviewUpdated != null:
return reviewUpdated(_that);case _ReviewDeleted() when reviewDeleted != null:
return reviewDeleted(_that);case _ActionError() when actionError != null:
return actionError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ReviewsResponseModel response)?  success,TResult Function( String message)?  error,TResult Function()?  actionLoading,TResult Function()?  reviewCreated,TResult Function()?  reviewUpdated,TResult Function()?  reviewDeleted,TResult Function( String message)?  actionError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.response);case _Error() when error != null:
return error(_that.message);case _ActionLoading() when actionLoading != null:
return actionLoading();case _ReviewCreated() when reviewCreated != null:
return reviewCreated();case _ReviewUpdated() when reviewUpdated != null:
return reviewUpdated();case _ReviewDeleted() when reviewDeleted != null:
return reviewDeleted();case _ActionError() when actionError != null:
return actionError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ReviewsResponseModel response)  success,required TResult Function( String message)  error,required TResult Function()  actionLoading,required TResult Function()  reviewCreated,required TResult Function()  reviewUpdated,required TResult Function()  reviewDeleted,required TResult Function( String message)  actionError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.response);case _Error():
return error(_that.message);case _ActionLoading():
return actionLoading();case _ReviewCreated():
return reviewCreated();case _ReviewUpdated():
return reviewUpdated();case _ReviewDeleted():
return reviewDeleted();case _ActionError():
return actionError(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ReviewsResponseModel response)?  success,TResult? Function( String message)?  error,TResult? Function()?  actionLoading,TResult? Function()?  reviewCreated,TResult? Function()?  reviewUpdated,TResult? Function()?  reviewDeleted,TResult? Function( String message)?  actionError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.response);case _Error() when error != null:
return error(_that.message);case _ActionLoading() when actionLoading != null:
return actionLoading();case _ReviewCreated() when reviewCreated != null:
return reviewCreated();case _ReviewUpdated() when reviewUpdated != null:
return reviewUpdated();case _ReviewDeleted() when reviewDeleted != null:
return reviewDeleted();case _ActionError() when actionError != null:
return actionError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ReviewsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReviewsState.initial()';
}


}




/// @nodoc


class _Loading implements ReviewsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReviewsState.loading()';
}


}




/// @nodoc


class _Success implements ReviewsState {
  const _Success(this.response);
  

 final  ReviewsResponseModel response;

/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'ReviewsState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $ReviewsStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 ReviewsResponseModel response
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(_Success(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as ReviewsResponseModel,
  ));
}


}

/// @nodoc


class _Error implements ReviewsState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of ReviewsState
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
  return 'ReviewsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ReviewsStateCopyWith<$Res> {
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

/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ActionLoading implements ReviewsState {
  const _ActionLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReviewsState.actionLoading()';
}


}




/// @nodoc


class _ReviewCreated implements ReviewsState {
  const _ReviewCreated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewCreated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReviewsState.reviewCreated()';
}


}




/// @nodoc


class _ReviewUpdated implements ReviewsState {
  const _ReviewUpdated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewUpdated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReviewsState.reviewUpdated()';
}


}




/// @nodoc


class _ReviewDeleted implements ReviewsState {
  const _ReviewDeleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReviewsState.reviewDeleted()';
}


}




/// @nodoc


class _ActionError implements ReviewsState {
  const _ActionError(this.message);
  

 final  String message;

/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActionErrorCopyWith<_ActionError> get copyWith => __$ActionErrorCopyWithImpl<_ActionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActionError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ReviewsState.actionError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ActionErrorCopyWith<$Res> implements $ReviewsStateCopyWith<$Res> {
  factory _$ActionErrorCopyWith(_ActionError value, $Res Function(_ActionError) _then) = __$ActionErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ActionErrorCopyWithImpl<$Res>
    implements _$ActionErrorCopyWith<$Res> {
  __$ActionErrorCopyWithImpl(this._self, this._then);

  final _ActionError _self;
  final $Res Function(_ActionError) _then;

/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ActionError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

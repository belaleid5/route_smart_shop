// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReviewsEvent {

 String get productId;
/// Create a copy of ReviewsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewsEventCopyWith<ReviewsEvent> get copyWith => _$ReviewsEventCopyWithImpl<ReviewsEvent>(this as ReviewsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewsEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'ReviewsEvent(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $ReviewsEventCopyWith<$Res>  {
  factory $ReviewsEventCopyWith(ReviewsEvent value, $Res Function(ReviewsEvent) _then) = _$ReviewsEventCopyWithImpl;
@useResult
$Res call({
 String productId
});




}
/// @nodoc
class _$ReviewsEventCopyWithImpl<$Res>
    implements $ReviewsEventCopyWith<$Res> {
  _$ReviewsEventCopyWithImpl(this._self, this._then);

  final ReviewsEvent _self;
  final $Res Function(ReviewsEvent) _then;

/// Create a copy of ReviewsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewsEvent].
extension ReviewsEventPatterns on ReviewsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetProductReviewsEvent value)?  getProductReviews,TResult Function( CreateReviewEvent value)?  createReview,TResult Function( UpdateReviewEvent value)?  updateReview,TResult Function( DeleteReviewEvent value)?  deleteReview,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetProductReviewsEvent() when getProductReviews != null:
return getProductReviews(_that);case CreateReviewEvent() when createReview != null:
return createReview(_that);case UpdateReviewEvent() when updateReview != null:
return updateReview(_that);case DeleteReviewEvent() when deleteReview != null:
return deleteReview(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetProductReviewsEvent value)  getProductReviews,required TResult Function( CreateReviewEvent value)  createReview,required TResult Function( UpdateReviewEvent value)  updateReview,required TResult Function( DeleteReviewEvent value)  deleteReview,}){
final _that = this;
switch (_that) {
case GetProductReviewsEvent():
return getProductReviews(_that);case CreateReviewEvent():
return createReview(_that);case UpdateReviewEvent():
return updateReview(_that);case DeleteReviewEvent():
return deleteReview(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetProductReviewsEvent value)?  getProductReviews,TResult? Function( CreateReviewEvent value)?  createReview,TResult? Function( UpdateReviewEvent value)?  updateReview,TResult? Function( DeleteReviewEvent value)?  deleteReview,}){
final _that = this;
switch (_that) {
case GetProductReviewsEvent() when getProductReviews != null:
return getProductReviews(_that);case CreateReviewEvent() when createReview != null:
return createReview(_that);case UpdateReviewEvent() when updateReview != null:
return updateReview(_that);case DeleteReviewEvent() when deleteReview != null:
return deleteReview(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String productId,  int? page)?  getProductReviews,TResult Function( String productId,  String review,  double rating)?  createReview,TResult Function( String productId,  String reviewId,  String review,  double rating)?  updateReview,TResult Function( String productId,  String reviewId)?  deleteReview,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetProductReviewsEvent() when getProductReviews != null:
return getProductReviews(_that.productId,_that.page);case CreateReviewEvent() when createReview != null:
return createReview(_that.productId,_that.review,_that.rating);case UpdateReviewEvent() when updateReview != null:
return updateReview(_that.productId,_that.reviewId,_that.review,_that.rating);case DeleteReviewEvent() when deleteReview != null:
return deleteReview(_that.productId,_that.reviewId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String productId,  int? page)  getProductReviews,required TResult Function( String productId,  String review,  double rating)  createReview,required TResult Function( String productId,  String reviewId,  String review,  double rating)  updateReview,required TResult Function( String productId,  String reviewId)  deleteReview,}) {final _that = this;
switch (_that) {
case GetProductReviewsEvent():
return getProductReviews(_that.productId,_that.page);case CreateReviewEvent():
return createReview(_that.productId,_that.review,_that.rating);case UpdateReviewEvent():
return updateReview(_that.productId,_that.reviewId,_that.review,_that.rating);case DeleteReviewEvent():
return deleteReview(_that.productId,_that.reviewId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String productId,  int? page)?  getProductReviews,TResult? Function( String productId,  String review,  double rating)?  createReview,TResult? Function( String productId,  String reviewId,  String review,  double rating)?  updateReview,TResult? Function( String productId,  String reviewId)?  deleteReview,}) {final _that = this;
switch (_that) {
case GetProductReviewsEvent() when getProductReviews != null:
return getProductReviews(_that.productId,_that.page);case CreateReviewEvent() when createReview != null:
return createReview(_that.productId,_that.review,_that.rating);case UpdateReviewEvent() when updateReview != null:
return updateReview(_that.productId,_that.reviewId,_that.review,_that.rating);case DeleteReviewEvent() when deleteReview != null:
return deleteReview(_that.productId,_that.reviewId);case _:
  return null;

}
}

}

/// @nodoc


class GetProductReviewsEvent implements ReviewsEvent {
  const GetProductReviewsEvent({required this.productId, this.page});
  

@override final  String productId;
 final  int? page;

/// Create a copy of ReviewsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProductReviewsEventCopyWith<GetProductReviewsEvent> get copyWith => _$GetProductReviewsEventCopyWithImpl<GetProductReviewsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductReviewsEvent&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,productId,page);

@override
String toString() {
  return 'ReviewsEvent.getProductReviews(productId: $productId, page: $page)';
}


}

/// @nodoc
abstract mixin class $GetProductReviewsEventCopyWith<$Res> implements $ReviewsEventCopyWith<$Res> {
  factory $GetProductReviewsEventCopyWith(GetProductReviewsEvent value, $Res Function(GetProductReviewsEvent) _then) = _$GetProductReviewsEventCopyWithImpl;
@override @useResult
$Res call({
 String productId, int? page
});




}
/// @nodoc
class _$GetProductReviewsEventCopyWithImpl<$Res>
    implements $GetProductReviewsEventCopyWith<$Res> {
  _$GetProductReviewsEventCopyWithImpl(this._self, this._then);

  final GetProductReviewsEvent _self;
  final $Res Function(GetProductReviewsEvent) _then;

/// Create a copy of ReviewsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? page = freezed,}) {
  return _then(GetProductReviewsEvent(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class CreateReviewEvent implements ReviewsEvent {
  const CreateReviewEvent({required this.productId, required this.review, required this.rating});
  

@override final  String productId;
 final  String review;
 final  double rating;

/// Create a copy of ReviewsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateReviewEventCopyWith<CreateReviewEvent> get copyWith => _$CreateReviewEventCopyWithImpl<CreateReviewEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateReviewEvent&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.review, review) || other.review == review)&&(identical(other.rating, rating) || other.rating == rating));
}


@override
int get hashCode => Object.hash(runtimeType,productId,review,rating);

@override
String toString() {
  return 'ReviewsEvent.createReview(productId: $productId, review: $review, rating: $rating)';
}


}

/// @nodoc
abstract mixin class $CreateReviewEventCopyWith<$Res> implements $ReviewsEventCopyWith<$Res> {
  factory $CreateReviewEventCopyWith(CreateReviewEvent value, $Res Function(CreateReviewEvent) _then) = _$CreateReviewEventCopyWithImpl;
@override @useResult
$Res call({
 String productId, String review, double rating
});




}
/// @nodoc
class _$CreateReviewEventCopyWithImpl<$Res>
    implements $CreateReviewEventCopyWith<$Res> {
  _$CreateReviewEventCopyWithImpl(this._self, this._then);

  final CreateReviewEvent _self;
  final $Res Function(CreateReviewEvent) _then;

/// Create a copy of ReviewsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? review = null,Object? rating = null,}) {
  return _then(CreateReviewEvent(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,review: null == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class UpdateReviewEvent implements ReviewsEvent {
  const UpdateReviewEvent({required this.productId, required this.reviewId, required this.review, required this.rating});
  

@override final  String productId;
 final  String reviewId;
 final  String review;
 final  double rating;

/// Create a copy of ReviewsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateReviewEventCopyWith<UpdateReviewEvent> get copyWith => _$UpdateReviewEventCopyWithImpl<UpdateReviewEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateReviewEvent&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.reviewId, reviewId) || other.reviewId == reviewId)&&(identical(other.review, review) || other.review == review)&&(identical(other.rating, rating) || other.rating == rating));
}


@override
int get hashCode => Object.hash(runtimeType,productId,reviewId,review,rating);

@override
String toString() {
  return 'ReviewsEvent.updateReview(productId: $productId, reviewId: $reviewId, review: $review, rating: $rating)';
}


}

/// @nodoc
abstract mixin class $UpdateReviewEventCopyWith<$Res> implements $ReviewsEventCopyWith<$Res> {
  factory $UpdateReviewEventCopyWith(UpdateReviewEvent value, $Res Function(UpdateReviewEvent) _then) = _$UpdateReviewEventCopyWithImpl;
@override @useResult
$Res call({
 String productId, String reviewId, String review, double rating
});




}
/// @nodoc
class _$UpdateReviewEventCopyWithImpl<$Res>
    implements $UpdateReviewEventCopyWith<$Res> {
  _$UpdateReviewEventCopyWithImpl(this._self, this._then);

  final UpdateReviewEvent _self;
  final $Res Function(UpdateReviewEvent) _then;

/// Create a copy of ReviewsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? reviewId = null,Object? review = null,Object? rating = null,}) {
  return _then(UpdateReviewEvent(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,reviewId: null == reviewId ? _self.reviewId : reviewId // ignore: cast_nullable_to_non_nullable
as String,review: null == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class DeleteReviewEvent implements ReviewsEvent {
  const DeleteReviewEvent({required this.productId, required this.reviewId});
  

@override final  String productId;
 final  String reviewId;

/// Create a copy of ReviewsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteReviewEventCopyWith<DeleteReviewEvent> get copyWith => _$DeleteReviewEventCopyWithImpl<DeleteReviewEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteReviewEvent&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.reviewId, reviewId) || other.reviewId == reviewId));
}


@override
int get hashCode => Object.hash(runtimeType,productId,reviewId);

@override
String toString() {
  return 'ReviewsEvent.deleteReview(productId: $productId, reviewId: $reviewId)';
}


}

/// @nodoc
abstract mixin class $DeleteReviewEventCopyWith<$Res> implements $ReviewsEventCopyWith<$Res> {
  factory $DeleteReviewEventCopyWith(DeleteReviewEvent value, $Res Function(DeleteReviewEvent) _then) = _$DeleteReviewEventCopyWithImpl;
@override @useResult
$Res call({
 String productId, String reviewId
});




}
/// @nodoc
class _$DeleteReviewEventCopyWithImpl<$Res>
    implements $DeleteReviewEventCopyWith<$Res> {
  _$DeleteReviewEventCopyWithImpl(this._self, this._then);

  final DeleteReviewEvent _self;
  final $Res Function(DeleteReviewEvent) _then;

/// Create a copy of ReviewsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? reviewId = null,}) {
  return _then(DeleteReviewEvent(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,reviewId: null == reviewId ? _self.reviewId : reviewId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

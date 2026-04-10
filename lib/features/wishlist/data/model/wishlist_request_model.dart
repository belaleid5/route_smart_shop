// wishlist_request_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'wishlist_request_model.g.dart';

@JsonSerializable()
class WishlistRequestModel {
  final String productId;

  WishlistRequestModel({required this.productId});

  factory WishlistRequestModel.fromJson(Map<String, dynamic> json) =>
      _$WishlistRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$WishlistRequestModelToJson(this);
}
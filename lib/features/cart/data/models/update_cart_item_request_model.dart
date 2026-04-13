import 'package:json_annotation/json_annotation.dart';

part 'update_cart_item_request_model.g.dart';

@JsonSerializable()
class UpdateCartItemRequestModel {
  final int count;

  const UpdateCartItemRequestModel({required this.count});

  factory UpdateCartItemRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateCartItemRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCartItemRequestModelToJson(this);
}
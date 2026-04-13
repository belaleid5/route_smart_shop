import 'package:json_annotation/json_annotation.dart';

part 'cart_request_model.g.dart';

@JsonSerializable()
class CartRequestModel {
  final String productId;

  const CartRequestModel({required this.productId});

  factory CartRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CartRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartRequestModelToJson(this);
}
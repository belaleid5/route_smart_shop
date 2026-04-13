import 'package:json_annotation/json_annotation.dart';
import 'cart_data_model.dart';

part 'cart_response_model.g.dart';

@JsonSerializable()
class CartResponseModel {
  final String status;
  final String? message;

  @JsonKey(name: 'numOfCartItems')
  final int itemCount;

  @JsonKey(name: 'cartId')
  final String? cartId;

  final CartDataModel? data;

  const CartResponseModel({
    required this.status,
    required this.itemCount,
    this.message,
    this.cartId,
    this.data,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseModelToJson(this);
}
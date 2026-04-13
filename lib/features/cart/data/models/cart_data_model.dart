import 'package:json_annotation/json_annotation.dart';
import 'cart_item_model.dart';

part 'cart_data_model.g.dart';

@JsonSerializable()
class CartDataModel {
  final List<CartItemModel> products;

  @JsonKey(name: 'totalCartPrice')
  final double totalPrice;

  const CartDataModel({
    required this.products,
    required this.totalPrice,
  });

  factory CartDataModel.fromJson(Map<String, dynamic> json) =>
      _$CartDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataModelToJson(this);
}
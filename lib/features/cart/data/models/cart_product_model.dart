import 'package:json_annotation/json_annotation.dart';

part 'cart_product_model.g.dart';

@JsonSerializable()
class CartProductModel {
  @JsonKey(name: '_id')
  final String id;

  final String title;

  @JsonKey(name: 'imageCover')
  final String? imageUrl;

  final double price;

  const CartProductModel({
    required this.id,
    required this.title,
    this.imageUrl,
    required this.price,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductModelToJson(this);
}
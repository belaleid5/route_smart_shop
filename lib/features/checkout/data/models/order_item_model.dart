import 'package:json_annotation/json_annotation.dart';

part 'order_item_model.g.dart';

@JsonSerializable()
class OrderItemModel {
  @JsonKey(name: '_id')
  final String? id;
  final int? count;
  final double? price;
  final OrderItemProduct? product;

  const OrderItemModel({
    this.id,
    this.count,
    this.price,
    this.product,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemModelToJson(this);
}

@JsonSerializable()
class OrderItemProduct {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final String? imageCover;
  final double? ratingsAverage;

  const OrderItemProduct({
    this.id,
    this.title,
    this.imageCover,
    this.ratingsAverage,
  });

  factory OrderItemProduct.fromJson(Map<String, dynamic> json) =>
      _$OrderItemProductFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemProductToJson(this);
}
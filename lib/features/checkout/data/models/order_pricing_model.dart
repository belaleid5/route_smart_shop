import 'package:json_annotation/json_annotation.dart';

part 'order_pricing_model.g.dart';

@JsonSerializable()
class OrderPricingModel {
  final double? cartPrice;
  final double? taxPrice;
  final double? shippingPrice;
  final double? totalOrderPrice;

  const OrderPricingModel({
    this.cartPrice,
    this.taxPrice,
    this.shippingPrice,
    this.totalOrderPrice,
  });

  factory OrderPricingModel.fromJson(Map<String, dynamic> json) =>
      _$OrderPricingModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPricingModelToJson(this);
}
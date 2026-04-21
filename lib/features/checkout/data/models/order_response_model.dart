import 'package:json_annotation/json_annotation.dart';
import 'order_data_model.dart';
import 'order_pricing_model.dart';
import 'order_user_model.dart';

part 'order_response_model.g.dart';

@JsonSerializable()
class OrderResponseModel {
  final String? status;
  final String? message;
  final OrderUserModel? user;
  final OrderPricingModel? pricing;
  final OrderDataModel? data;

  const OrderResponseModel({
    this.status,
    this.message,
    this.user,
    this.pricing,
    this.data,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseModelToJson(this);
}
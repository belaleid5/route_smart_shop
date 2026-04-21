import 'package:json_annotation/json_annotation.dart';
import 'order_item_model.dart';
import 'order_user_model.dart';
import 'shipping_address_model.dart';

part 'order_data_model.g.dart';

@JsonSerializable()
class OrderDataModel {
  @JsonKey(name: '_id')
  final String? id;
  final ShippingAddressModel? shippingAddress;
  final double? taxPrice;
  final double? shippingPrice;
  final double? totalOrderPrice;
  final String? paymentMethodType;
  final bool? isPaid;
  final bool? isDelivered;
  final OrderUserModel? user;
  final List<OrderItemModel>? cartItems;
  final String? createdAt;

  const OrderDataModel({
    this.id,
    this.shippingAddress,
    this.taxPrice,
    this.shippingPrice,
    this.totalOrderPrice,
    this.paymentMethodType,
    this.isPaid,
    this.isDelivered,
    this.user,
    this.cartItems,
    this.createdAt,
  });

  factory OrderDataModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDataModelToJson(this);
}
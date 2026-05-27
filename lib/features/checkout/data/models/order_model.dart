
import 'package:route_smart/features/checkout/domain/entites/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    super.id,
    super.status,
    super.totalOrderPrice,
    super.isPaid,
    super.isDelivered,
    super.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['_id'] as String?,
        status: json['status'] as String?,
        totalOrderPrice: (json['totalOrderPrice'] as num?)?.toDouble(),
        isPaid: json['isPaid'] as bool?,
        isDelivered: json['isDelivered'] as bool?,
        createdAt: json['createdAt'] != null
            ? DateTime.tryParse(json['createdAt'] as String)
            : null,
      );
}

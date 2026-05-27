class OrderEntity {
  final String? id;
  final String? status;
  final double? totalOrderPrice;
  final bool? isPaid;
  final bool? isDelivered;
  final DateTime? createdAt;

  const OrderEntity({
    this.id,
    this.status,
    this.totalOrderPrice,
    this.isPaid,
    this.isDelivered,
    this.createdAt,
  });
}

import 'package:route_smart/core/helper/json_reader.dart';

final class CartRequestModel {
  const CartRequestModel({
    required this.productId,
  });

  final String productId;

  factory CartRequestModel.fromJson(Map<String, dynamic> json) {
    return CartRequestModel(
      productId: JsonReader.string(json['productId']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
    };
  }
}

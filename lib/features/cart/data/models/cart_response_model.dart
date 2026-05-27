import 'package:route_smart/core/helper/json_reader.dart';

import 'cart_data_model.dart';

final class CartResponseModel {
  const CartResponseModel({
    required this.status,
    required this.itemCount,
    this.message,
    this.cartId,
    this.data,
  });

  final String status;
  final String? message;
  final int itemCount;
  final String? cartId;
  final CartDataModel? data;

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    final dataJson = JsonReader.map(json['data']);

    return CartResponseModel(
      status: JsonReader.string(json['status']),
      message: JsonReader.nullableString(json['message']),
      itemCount: JsonReader.integer(
        json['numOfCartItems'] ?? json['itemCount'],
        fallback: JsonReader.mapList(dataJson?['products']).length,
      ),
      cartId: JsonReader.nullableString(
        json['cartId'] ?? dataJson?['_id'] ?? dataJson?['id'],
      ),
      data: dataJson == null ? null : CartDataModel.fromJson(dataJson),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      if (message != null) 'message': message,
      'numOfCartItems': itemCount,
      if (cartId != null) 'cartId': cartId,
      if (data != null) 'data': data!.toJson(),
    };
  }
}

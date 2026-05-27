import 'package:route_smart/features/cart/data/models/cart_item_model.dart';
import 'package:route_smart/features/cart/data/models/cart_response_model.dart';
import 'package:route_smart/features/cart/domain/entites/cart_entity.dart';
import 'package:route_smart/features/cart/domain/entites/cart_item_entity.dart';

extension CartResponseModelMapper on CartResponseModel {
  CartEntity toEntity() {
    final cartData = data;

    return CartEntity(
      id: cartId ?? cartData?.id ?? '',
      userId: cartData?.userId ?? '',
      items: cartData?.products
              .map((item) => item.toEntity())
              .toList(growable: false) ??
          const <CartItemEntity>[],
      totalPrice: cartData?.totalPrice ?? 0,
    );
  }
}

extension CartItemModelMapper on CartItemModel {
  CartItemEntity toEntity() {
    return CartItemEntity(
      cartItemId: cartItemId,
      productId: productId,
      productName: productName,
      quantity: quantity,
      price: price,
      imageUrl: imageUrl,
    );
  }
}
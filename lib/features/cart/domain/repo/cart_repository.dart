import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/cart/domain/entites/cart_entity.dart';

abstract interface class CartRepository {
  Future<ApiResult<CartEntity>> getCart();

  Future<ApiResult<CartEntity>> addToCart({
    required String productId,
   
  });

  Future<ApiResult<CartEntity>> updateCartItem({
    required String productId,
    required int count,
  });

  Future<ApiResult<CartEntity>> removeCartItem({
    required String productId,
  });

  Future<ApiResult<bool>> clearCart();
}
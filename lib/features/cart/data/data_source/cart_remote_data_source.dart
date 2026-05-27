import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/features/auth_feature/data/models/message_response_model.dart';
import 'package:route_smart/features/cart/data/models/cart_request_model.dart';
import 'package:route_smart/features/cart/data/models/cart_response_model.dart';
import 'package:route_smart/features/cart/data/models/update_cart_item_request_model.dart';

abstract interface class CartRemoteDataSource {
  Future<CartResponseModel> getCart();

  Future<CartResponseModel> addToCart(
    CartRequestModel request,
  );

  Future<CartResponseModel> updateCartItemQuantity({
    required String productId,
    required UpdateCartItemRequestModel request,
  });

  Future<CartResponseModel> removeCartItem({
    required String productId,
  });

  Future<MessageResponseModel> clearCart();
}

final class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  const CartRemoteDataSourceImpl( {
    required ApiService apiService,
  }) : _apiService = apiService;

  final ApiService _apiService;

  @override
  Future<CartResponseModel> getCart() {
    return _apiService.getCart();
  }

  @override
  Future<CartResponseModel> addToCart(
    CartRequestModel request,
  ) {
    return _apiService.addToCart(request);
  }

  @override
  Future<CartResponseModel> updateCartItemQuantity({
    required String productId,
    required UpdateCartItemRequestModel request,
  }) {
    return _apiService.updateCartItemQuantity(
      productId,
      request,
    );
  }

  @override
  Future<CartResponseModel> removeCartItem({
    required String productId,
  }) {
    return _apiService.removeCartItem(productId);
  }

  @override
  Future<MessageResponseModel> clearCart() {
    return _apiService.clearCart();
  }
}
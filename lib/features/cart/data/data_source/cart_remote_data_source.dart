import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/core/services/flutter_secure.dart';
import 'package:route_smart/core/services/shared_pref/shared_keys.dart';
import 'package:route_smart/features/auth_feature/data/models/message_response_model.dart';
import 'package:route_smart/features/cart/data/models/cart_request_model.dart';
import 'package:route_smart/features/cart/data/models/cart_response_model.dart';
import 'package:route_smart/features/cart/data/models/update_cart_item_request_model.dart';

abstract class CartRemoteDataSource {
  Future<CartResponseModel> getCart();
  Future<CartResponseModel> addToCart(CartRequestModel request);
  Future<CartResponseModel> updateCartItemQuantity(
    String cartItemId,
    UpdateCartItemRequestModel request,
  );
  Future<CartResponseModel> removeCartItem(String cartItemId);
  Future<MessageResponseModel> clearCart();
}




class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiService _apiService;
  final SecureStorage _secureStorage;

  CartRemoteDataSourceImpl(this._apiService, this._secureStorage);

  Future<String> _getToken() async {
    final token = await _secureStorage.getString(PrefKeys.accessToken);
    if (token == null || token.isEmpty) {
      throw Exception('User not authenticated');
    }
    return token;
  }

  @override
  Future<CartResponseModel> getCart() async {
    final token = await _getToken();
    return await _apiService.getCart(token);
  }

  @override
  Future<CartResponseModel> addToCart(CartRequestModel request) async {
    final token = await _getToken();
    return await _apiService.addToCart(token, request);
  }

@override
Future<CartResponseModel> updateCartItemQuantity(
  String productId,
  UpdateCartItemRequestModel request,
) async {
  final token = await _getToken();
  return await _apiService.updateCartItemQuantity(token, productId, request);
}

@override
Future<CartResponseModel> removeCartItem(String productId) async { 
  final token = await _getToken();
  return await _apiService.removeCartItem(token, productId);
}

  @override
  Future<MessageResponseModel> clearCart() async {
    final token = await _getToken();
    return await _apiService.clearCart(token);
  }
}
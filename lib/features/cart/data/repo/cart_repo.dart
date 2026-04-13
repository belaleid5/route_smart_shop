import 'package:dio/dio.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/auth_feature/data/models/message_response_model.dart';
import 'package:route_smart/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:route_smart/features/cart/data/models/cart_request_model.dart';
import 'package:route_smart/features/cart/data/models/cart_response_model.dart';
import 'package:route_smart/features/cart/data/models/update_cart_item_request_model.dart';

class CartRepositoryImpl  {
  final CartRemoteDataSource _remoteDataSource;

  CartRepositoryImpl(this._remoteDataSource);

  String _handleDioError(DioException error) {
    if (error.response != null) {
      return error.response?.data['message'] ?? 'حدث خطأ في الخادم';
    }
    return 'تحقق من اتصالك بالإنترنت';
  }



  Future<ApiResult<CartResponseModel>> getCart() async {
    try {
      final response = await _remoteDataSource.getCart();
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(_handleDioError(e));
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }



  Future<ApiResult<CartResponseModel>> addToCart(String productId) async {
    try {
      if (productId.isEmpty) {
        return const ApiResult.failure('معرف المنتج غير صحيح');
      }

      final response = await _remoteDataSource.addToCart(
        CartRequestModel(productId: productId),
      );
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(_handleDioError(e));
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<CartResponseModel>> updateCartItemQuantity(
    String productId,
    int count,
  ) async {
    try {
      if (count < 1) {
        return const ApiResult.failure('الكمية يجب أن تكون على الأقل 1');
      }

      final response = await _remoteDataSource.updateCartItemQuantity(
        productId,
        UpdateCartItemRequestModel(count: count),
      );
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(_handleDioError(e));
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<CartResponseModel>> removeCartItem(String productId) async {
    try {
      final response = await _remoteDataSource.removeCartItem(productId);
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(_handleDioError(e));
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<MessageResponseModel>> clearCart() async {
    try {
      final response = await _remoteDataSource.clearCart();
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(_handleDioError(e));
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
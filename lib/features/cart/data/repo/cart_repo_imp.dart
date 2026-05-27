import 'package:route_smart/core/errors/api_error_handler.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:route_smart/features/cart/data/mapper/cart_model_mapper.dart';
import 'package:route_smart/features/cart/data/models/cart_request_model.dart';
import 'package:route_smart/features/cart/data/models/cart_response_model.dart';
import 'package:route_smart/features/cart/data/models/update_cart_item_request_model.dart';
import 'package:route_smart/features/cart/domain/entites/cart_entity.dart';
import 'package:route_smart/features/cart/domain/repo/cart_repository.dart';

final class CartRepositoryImpl implements CartRepository {
  const CartRepositoryImpl({
    required CartRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final CartRemoteDataSource _remoteDataSource;

  @override
  Future<ApiResult<CartEntity>> getCart() {
    return _requestCart(_remoteDataSource.getCart);
  }

  @override
  Future<ApiResult<CartEntity>> addToCart({
    required String productId,
  }) {
    return _requestCart(
      () => _remoteDataSource.addToCart(
        CartRequestModel(productId: productId),
      ),
    );
  }

  @override
  Future<ApiResult<CartEntity>> updateCartItem({
    required String productId,
    required int count,
  }) {
    return _requestCart(
      () => _remoteDataSource.updateCartItemQuantity(
        productId: productId,
        request: UpdateCartItemRequestModel(count: count),
      ),
    );
  }

  @override
  Future<ApiResult<CartEntity>> removeCartItem({
    required String productId,
  }) {
    return _requestCart(
      () => _remoteDataSource.removeCartItem(
        productId: productId,
      ),
    );
  }

  @override
  Future<ApiResult<bool>> clearCart() async {
    try {
      await _remoteDataSource.clearCart();

      return const Success<bool>(true);
    } catch (error) {
      return Failure<bool>(_mapFailure(error));
    }
  }

  Future<ApiResult<CartEntity>> _requestCart(
    Future<CartResponseModel> Function() request,
  ) async {
    try {
      final response = await request();

      return Success<CartEntity>(response.toEntity());
    } catch (error) {
      return Failure<CartEntity>(_mapFailure(error));
    }
  }

  String _mapFailure(Object error) {
    final errorHandler = ErrorHandler.handle(error);

    return errorHandler.apiErrorModel.message ?? ResponseMessage.DEFAULT;
  }
}
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/cart/domain/entites/cart_entity.dart';
import 'package:route_smart/features/cart/domain/repo/cart_repository.dart';

final class RemoveCartItemUseCase {
  const RemoveCartItemUseCase(this._repository);

  final CartRepository _repository;

  Future<ApiResult<CartEntity>> call({
    required String productId,
  }) {
    return _repository.removeCartItem(productId: productId);
  }
}
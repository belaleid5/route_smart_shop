import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/cart/domain/entites/cart_entity.dart';
import 'package:route_smart/features/cart/domain/repo/cart_repository.dart';

final class UpdateCartItemUseCase {
  const UpdateCartItemUseCase(this._repository);

  final CartRepository _repository;

  Future<ApiResult<CartEntity>> call({
    required String productId,
    required int count,
  }) {
    return _repository.updateCartItem(
      productId: productId,
      count: count,
    );
  }
}
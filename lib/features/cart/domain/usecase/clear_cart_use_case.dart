import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/cart/domain/repo/cart_repository.dart';

final class ClearCartUseCase {
  const ClearCartUseCase(this._repository);

  final CartRepository _repository;

  Future<ApiResult<bool>> call() {
    return _repository.clearCart();
  }
}
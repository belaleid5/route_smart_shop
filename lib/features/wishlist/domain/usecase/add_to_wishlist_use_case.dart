// features/wishlist/domain/use_cases/add_to_wishlist_use_case.dart

import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/wishlist/domain/repo/wishlist_repository.dart';

class AddToWishlistUseCase {
  const AddToWishlistUseCase(this._repository);

  final WishlistRepository _repository;

  Future<ApiResult<void>> call(String productId) {
    return _repository.addToWishlist(productId);
  }
}
// features/wishlist/domain/use_cases/get_wishlist_use_case.dart

import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/wishlist/domain/entites/wishlist_entity.dart';
import 'package:route_smart/features/wishlist/domain/repo/wishlist_repository.dart';

class GetWishlistUseCase {
  const GetWishlistUseCase(this._repository);

  final WishlistRepository _repository;

  Future<ApiResult<List<WishlistEntity>>> call() {
    return _repository.getWishlist();
  }
}
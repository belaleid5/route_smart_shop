// features/wishlist/domain/repositories/wishlist_repository.dart

import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/wishlist/domain/entites/wishlist_entity.dart';

abstract class WishlistRepository {
  Future<ApiResult<List<WishlistEntity>>> getWishlist();
  Future<ApiResult<void>> addToWishlist(String productId);
  Future<ApiResult<void>> removeFromWishlist(String productId);
}
// features/wishlist/data/repo/wishlist_repository_impl.dart

import 'package:route_smart/core/errors/api_error_handler.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:route_smart/features/wishlist/domain/entites/wishlist_entity.dart';
import 'package:route_smart/features/wishlist/domain/repo/wishlist_repository.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  const WishlistRepositoryImpl(this._remote);

  final WishlistRemoteDataSource _remote;

  @override
  Future<ApiResult<List<WishlistEntity>>> getWishlist() async {
    try {
      final res = await _remote.getWishlist();
      
      final entities = res.items
          .map((model) => model.toEntity())
          .toList();
          
      return Success(entities);
    } catch (e) {
      return Failure(
        ErrorHandler.handle(e).apiErrorModel.message ?? LangKeys.errorDefault,
      );
    }
  }

  @override
  Future<ApiResult<void>> addToWishlist(String productId) async {
    try {
      await _remote.addToWishlist(productId);
      return const Success(null);
    } catch (e) {
      return Failure(
        ErrorHandler.handle(e).apiErrorModel.message ?? LangKeys.errorDefault,
      );
    }
  }

  @override
  Future<ApiResult<void>> removeFromWishlist(String productId) async {
    try {
      await _remote.removeFromWishlist(productId);
      return const Success(null);
    } catch (e) {
      return Failure(
        ErrorHandler.handle(e).apiErrorModel.message ?? LangKeys.errorDefault,
      );
    }
  }
}
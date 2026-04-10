import 'package:route_smart/core/errors/api_error_handler.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/wishlist/data/data_source/wishlist_data_source.dart';
import 'package:route_smart/features/wishlist/data/model/wishlist_response_model.dart';

class WishlistRepository {
  final WishlistRemoteDataSource _remote;
  WishlistRepository(this._remote);

  Future<ApiResult<List<WishlistItemModel>>> getWishlist() async {
    try {
      final res = await _remote.getWishlist();
      if (res.status == "success") return ApiResult.success(res.items);
      return ApiResult.failure(res.status);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e).apiErrorModel.message ?? 'Error');
    }
  }
  Future<ApiResult<void>> addToWishlist(String id) async {
    try { await _remote.addToWishlist(id); return const ApiResult.success(null); }
    catch(e){ return ApiResult.failure(ErrorHandler.handle(e).apiErrorModel.message ?? 'Error'); }
  }
  Future<ApiResult<void>> removeFromWishlist(String id) async {
    try { await _remote.removeFromWishlist(id); return const ApiResult.success(null); }
    catch(e){ return ApiResult.failure(ErrorHandler.handle(e).apiErrorModel.message ?? 'Error'); }
  }
}
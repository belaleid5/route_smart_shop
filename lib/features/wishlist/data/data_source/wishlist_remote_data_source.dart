import 'package:route_smart/core/services/api/api_services.dart';
import '../model/wishlist_request_model.dart';
import '../model/wishlist_response_model.dart';

abstract class WishlistRemoteDataSource {
  Future<WishlistResponseModel> getWishlist();
  Future<void> addToWishlist(String productId);
  Future<void> removeFromWishlist(String productId);
}

class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  WishlistRemoteDataSourceImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<WishlistResponseModel> getWishlist() async {
    return _apiService.getWishlist();
  }

  @override
  Future<void> addToWishlist(String productId) async {
    await _apiService.addToWishlist(
      WishlistRequestModel(productId: productId),
    );
  }

  @override
  Future<void> removeFromWishlist(String productId) async {
    await _apiService.removeFromWishlist(productId);
  }
}
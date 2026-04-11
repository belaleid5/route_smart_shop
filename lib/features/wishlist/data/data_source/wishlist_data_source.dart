// wishlist_remote_data_source.dart
import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/core/services/flutter_secure.dart';
import 'package:route_smart/core/services/shared_pref/shared_keys.dart';
import 'package:route_smart/features/wishlist/data/model/wishlist_request_model.dart';
import 'package:route_smart/features/wishlist/data/model/wishlist_response_model.dart';

abstract class WishlistRemoteDataSource {
  Future<WishlistResponseModel> getWishlist();
  Future<void> addToWishlist(String productId);
  Future<void> removeFromWishlist(String productId);
}

class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  final ApiService _apiService;
  final SecureStorage _secureStorage;

  WishlistRemoteDataSourceImpl(this._apiService, this._secureStorage);

  @override
  Future<WishlistResponseModel> getWishlist() async {
    final token = await _secureStorage.getString(PrefKeys.accessToken);
    return await _apiService.getWishlist(token!);
  }

  @override
  Future<void> addToWishlist(String productId) async {
    final request = WishlistRequestModel(productId: productId);
    final token = await _secureStorage.getString(PrefKeys.accessToken);
    await _apiService.addToWishlist(token!, request);
  }

  @override
  Future<void> removeFromWishlist(String productId) async {
        final token = await _secureStorage.getString(PrefKeys.accessToken);
    await _apiService.removeFromWishlist(token!,productId);
  }
}

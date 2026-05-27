
import 'package:route_smart/features/wishlist/data/model/wishlist_item_model.dart';

class WishlistResponseModel {
  const WishlistResponseModel({
    required this.status,
    required this.count,
    required this.items,
  });

  final String status;
  final int count;
  final List<WishlistItemModel> items;

  factory WishlistResponseModel.fromJson(Map<String, dynamic> json) {
    return WishlistResponseModel(
      status: json['status'] as String,
      count: json['count'] as int? ?? 0,
      items: (json['data'] as List<dynamic>? ?? [])
          .map((e) => WishlistItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

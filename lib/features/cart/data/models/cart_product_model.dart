import 'package:route_smart/core/helper/json_reader.dart';

final class CartProductModel {
  const CartProductModel({
    required this.id,
    required this.title,
    required this.price,
    this.imageUrl,
  });

  final String id;
  final String title;
  final double price;
  final String? imageUrl;

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: JsonReader.string(json['_id'] ?? json['id']),
      title: JsonReader.string(json['title']),
      price: JsonReader.decimal(json['price']),
      imageUrl: JsonReader.nullableString(
        json['imageCover'] ?? json['imageUrl'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'imageCover': imageUrl,
      'price': price,
    };
  }
}

import 'package:route_smart/core/helper/json_reader.dart';

final class UpdateCartItemRequestModel {
  const UpdateCartItemRequestModel({
    required this.count,
  });

  final int count;

  factory UpdateCartItemRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdateCartItemRequestModel(
      count: JsonReader.integer(json['count']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
    };
  }
}

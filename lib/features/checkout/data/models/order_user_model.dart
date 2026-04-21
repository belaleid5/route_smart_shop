import 'package:json_annotation/json_annotation.dart';

part 'order_user_model.g.dart';

@JsonSerializable()
class OrderUserModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? email;
  final String? phone;

  const OrderUserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
  });

  factory OrderUserModel.fromJson(Map<String, dynamic> json) =>
      _$OrderUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderUserModelToJson(this);
}
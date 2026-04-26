import 'package:json_annotation/json_annotation.dart';

part 'review_user_model.g.dart';

@JsonSerializable()
class ReviewUserModel {
  @JsonKey(name: '_id')
  final String id;
  final String name;

  const ReviewUserModel({
    required this.id,
    required this.name,
  });

  factory ReviewUserModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewUserModelToJson(this);
}

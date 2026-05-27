
import 'package:route_smart/features/reviews/domain/entites/review_user_entity.dart';

class ReviewUserModel extends ReviewUserEntity {
  const ReviewUserModel({super.id, super.name});

  factory ReviewUserModel.fromJson(Map<String, dynamic> json) {
    return ReviewUserModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );
  }
}

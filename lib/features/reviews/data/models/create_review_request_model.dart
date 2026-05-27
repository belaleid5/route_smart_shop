class CreateReviewRequestModel {
  final String review;
  final num rating;

  const CreateReviewRequestModel({required this.review, required this.rating});

  Map<String, dynamic> toJson() {
    return {
      'review': review,
      'rating': rating,
    };
  }
}

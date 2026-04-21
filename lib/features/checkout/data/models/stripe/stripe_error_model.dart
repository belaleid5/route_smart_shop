import 'package:json_annotation/json_annotation.dart';

part 'stripe_error_model.g.dart';

@JsonSerializable()
class StripeErrorModel {
  final StripeErrorDetails? error;

  const StripeErrorModel({this.error});

  factory StripeErrorModel.fromJson(Map<String, dynamic> json) =>
      _$StripeErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$StripeErrorModelToJson(this);
}

@JsonSerializable()
class StripeErrorDetails {
  final String? message;
  final String? type;
  final String? code;

  @JsonKey(name: 'doc_url')
  final String? docUrl;

  final String? param;

  const StripeErrorDetails({
    this.message,
    this.type,
    this.code,
    this.docUrl,
    this.param,
  });

  factory StripeErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$StripeErrorDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$StripeErrorDetailsToJson(this);
}
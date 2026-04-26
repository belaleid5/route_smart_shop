import 'package:json_annotation/json_annotation.dart';

part 'payment_intent_request_model.g.dart';

@JsonSerializable()
class PaymentIntentRequestModel {
  /// Amount in the smallest currency unit (cents)
  /// e.g. 1000 = $10.00
  final String amount;

  /// Currency code (e.g. usd, egp)
  final String currency;

  const PaymentIntentRequestModel({
    required this.amount,
    required this.currency,
  });

  factory PaymentIntentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentIntentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentIntentRequestModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'payment_intent_response_model.g.dart';

@JsonSerializable()
class PaymentIntentResponseModel {
  final String? id;
  final String? object;
  final int? amount;

  @JsonKey(name: 'client_secret')
  final String? clientSecret;

  final String? currency;
  final String? customer;
  final String? description;
  final String? status;

  @JsonKey(name: 'payment_method')
  final String? paymentMethod;

  @JsonKey(name: 'payment_method_types')
  final List<String>? paymentMethodTypes;

  @JsonKey(name: 'created')
  final int? created;

  @JsonKey(name: 'livemode')
  final bool? livemode;

  const PaymentIntentResponseModel({
    this.id,
    this.object,
    this.amount,
    this.clientSecret,
    this.currency,
    this.customer,
    this.description,
    this.status,
    this.paymentMethod,
    this.paymentMethodTypes,
    this.created,
    this.livemode,
  });

  factory PaymentIntentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentIntentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentIntentResponseModelToJson(this);
}

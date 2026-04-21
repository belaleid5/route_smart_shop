// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentIntentRequestModel _$PaymentIntentRequestModelFromJson(
  Map<String, dynamic> json,
) => PaymentIntentRequestModel(
  amount: json['amount'] as String,
  currency: json['currency'] as String,
);

Map<String, dynamic> _$PaymentIntentRequestModelToJson(
  PaymentIntentRequestModel instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'currency': instance.currency,
};

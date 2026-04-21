// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentIntentResponseModel _$PaymentIntentResponseModelFromJson(
  Map<String, dynamic> json,
) => PaymentIntentResponseModel(
  id: json['id'] as String?,
  object: json['object'] as String?,
  amount: (json['amount'] as num?)?.toInt(),
  clientSecret: json['client_secret'] as String?,
  currency: json['currency'] as String?,
  customer: json['customer'] as String?,
  description: json['description'] as String?,
  status: json['status'] as String?,
  paymentMethod: json['payment_method'] as String?,
  paymentMethodTypes: (json['payment_method_types'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  created: (json['created'] as num?)?.toInt(),
  livemode: json['livemode'] as bool?,
);

Map<String, dynamic> _$PaymentIntentResponseModelToJson(
  PaymentIntentResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'amount': instance.amount,
  'client_secret': instance.clientSecret,
  'currency': instance.currency,
  'customer': instance.customer,
  'description': instance.description,
  'status': instance.status,
  'payment_method': instance.paymentMethod,
  'payment_method_types': instance.paymentMethodTypes,
  'created': instance.created,
  'livemode': instance.livemode,
};

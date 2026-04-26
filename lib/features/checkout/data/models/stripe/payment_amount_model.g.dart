// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_amount_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentAmountModel _$PaymentAmountModelFromJson(Map<String, dynamic> json) =>
    PaymentAmountModel(
      amount: json['amount'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$PaymentAmountModelToJson(PaymentAmountModel instance) =>
    <String, dynamic>{'amount': instance.amount, 'currency': instance.currency};

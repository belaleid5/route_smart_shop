import 'package:json_annotation/json_annotation.dart';
part 'payment_amount_model.g.dart';

@JsonSerializable()
class PaymentAmountModel {

  final String amount;

  final String currency;

  const PaymentAmountModel({
    required this.amount,
    required this.currency,
  });

  factory PaymentAmountModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentAmountModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentAmountModelToJson(this);

  factory PaymentAmountModel.fromAmount({
    required double amount,
    String currency = 'usd',
  }) {
    return PaymentAmountModel(
      amount: (amount * 100).toInt().toString(),
      currency: currency,
    );
  }
}
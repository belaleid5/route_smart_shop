class PaymentIntentModel {
  final String? clientSecret;
  final String? id;
  final int? amount;
  final String? currency;
  final String? status;

  const PaymentIntentModel({
    this.clientSecret,
    this.id,
    this.amount,
    this.currency,
    this.status,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) =>
      PaymentIntentModel(
        clientSecret: json['client_secret'] as String?,
        id: json['id'] as String?,
        amount: json['amount'] as int?,
        currency: json['currency'] as String?,
        status: json['status'] as String?,
      );
}

class EphemeralKeyModel {
  final String? id;
  final String? secret;
  final String? customerId;

  const EphemeralKeyModel({this.id, this.secret, this.customerId});

  factory EphemeralKeyModel.fromJson(Map<String, dynamic> json) =>
      EphemeralKeyModel(
        id: json['id'] as String?,
        secret: json['secret'] as String?,
        customerId: json['associated_objects'] != null
            ? ((json['associated_objects'] as List).first
                as Map<String, dynamic>)['id'] as String?
            : null,
      );
}

class StripeErrorModel {
  final String? message;
  final String? type;
  final String? code;

  const StripeErrorModel({this.message, this.type, this.code});

  factory StripeErrorModel.fromJson(Map<String, dynamic> json) {
    final error = json['error'] as Map<String, dynamic>?;
    return StripeErrorModel(
      message: error?['message'] as String?,
      type: error?['type'] as String?,
      code: error?['code'] as String?,
    );
  }
}

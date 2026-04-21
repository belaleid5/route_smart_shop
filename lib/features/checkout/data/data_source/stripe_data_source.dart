import 'package:route_smart/core/constants/api_constants.dart';
import 'package:route_smart/core/constants/stripe_keys.dart';
import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/features/checkout/data/models/stripe/ephemeral_key_response_model.dart';
import 'package:route_smart/features/checkout/data/models/stripe/payment_amount_model.dart';
import 'package:route_smart/features/checkout/data/models/stripe/payment_intent_response_model.dart';

abstract class StripeRemoteDataSource {
  Future<PaymentIntentResponseModel> createPaymentIntent(
    PaymentAmountModel paymentAmount,
  );

  Future<EphemeralKeyResponseModel> createEphemeralKey(String customerId);
}

class StripeRemoteDataSourceImpl implements StripeRemoteDataSource {
  final ApiService _apiService;

  StripeRemoteDataSourceImpl(this._apiService);

  @override
  Future<PaymentIntentResponseModel> createPaymentIntent(
    PaymentAmountModel paymentAmount,
  ) async {
    return await _apiService.createPaymentIntent(
      'Bearer ${StripeKeys.secretKey}',
      {
        'amount': paymentAmount.amount,
        'currency': paymentAmount.currency,
      },
    );
  }

  @override
  Future<EphemeralKeyResponseModel> createEphemeralKey(
    String customerId,
  ) async {
    return await _apiService.createEphemeralKey(
      'Bearer ${StripeKeys.secretKey}',
      ApiConstants.stripeApiVersion,
      {'customer': customerId},
    );
  }
}
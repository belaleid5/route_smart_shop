import 'package:route_smart/core/services/api/api_services.dart';
import 'package:route_smart/features/checkout/data/models/stripe_models.dart';

abstract class StripeRemoteDataSource {
  Future<PaymentIntentModel> createPaymentIntent({
    required int amount,
    required String currency,
  });

  Future<EphemeralKeyModel> createEphemeralKey(String customerId);
}

class StripeRemoteDataSourceImpl implements StripeRemoteDataSource {
  final ApiService _apiService;

  const StripeRemoteDataSourceImpl(this._apiService);

  @override
  Future<PaymentIntentModel> createPaymentIntent({
    required int amount,
    required String currency,
  }) =>
      _apiService.createPaymentIntent(amount: amount, currency: currency);

  @override
  Future<EphemeralKeyModel> createEphemeralKey(String customerId) =>
      _apiService.createEphemeralKey(customerId);
}
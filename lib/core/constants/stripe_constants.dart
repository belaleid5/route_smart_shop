abstract final class StripeConstants {
  StripeConstants._();

  static const String urlScheme = 'routesmart';
  static const String merchantDisplayName = 'Route Smart Store';
  static const String merchantCountryCode = 'EG';
  static const String currency = 'EGP';

  static const String stripeBaseUrl = 'https://api.stripe.com/v1';
  static const String stripeApiVersion = '2024-06-20';

  static const String paymentIntents = '$stripeBaseUrl/payment_intents';
  static const String ephemeralKeys = '$stripeBaseUrl/ephemeral_keys';
}
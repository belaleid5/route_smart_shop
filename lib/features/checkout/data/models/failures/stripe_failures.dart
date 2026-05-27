// lib/features/checkout/data/failures/stripe_failures.dart

sealed class StripeFailure {
  const StripeFailure();
  String get message;
}

class StripeServerFailure extends StripeFailure {
  @override
  final String message;
  const StripeServerFailure(this.message);
}

class StripeNetworkFailure extends StripeFailure {
  @override
  final String message;
  const StripeNetworkFailure(this.message);
}

class StripeUnauthorizedFailure extends StripeFailure {
  @override
  final String message;
  const StripeUnauthorizedFailure(this.message);
}

class StripeUnknownFailure extends StripeFailure {
  @override
  final String message;
  const StripeUnknownFailure(this.message);
}

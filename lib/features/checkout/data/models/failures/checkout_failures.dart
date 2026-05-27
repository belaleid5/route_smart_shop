// lib/features/checkout/data/failures/checkout_failures.dart

sealed class CheckoutFailure {
  const CheckoutFailure();
  String get message;
}

class CheckoutServerFailure extends CheckoutFailure {
  @override
  final String message;
  const CheckoutServerFailure(this.message);
}

class CheckoutNetworkFailure extends CheckoutFailure {
  @override
  final String message;
  const CheckoutNetworkFailure(this.message);
}

class CheckoutUnauthorizedFailure extends CheckoutFailure {
  @override
  final String message;
  const CheckoutUnauthorizedFailure(this.message);
}

class CheckoutValidationFailure extends CheckoutFailure {
  @override
  final String message;
  const CheckoutValidationFailure(this.message);
}

class CheckoutEmptyFailure extends CheckoutFailure {
  const CheckoutEmptyFailure();
  @override
  String get message => 'No data available';
}

class CheckoutUnknownFailure extends CheckoutFailure {
  @override
  final String message;
  const CheckoutUnknownFailure(this.message);
}

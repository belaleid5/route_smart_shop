import 'package:route_smart/core/services/api/api_result.dart';

abstract class StripeRepository {
  Future<ApiResult<bool>> makePayment({
    required double amount,
    String currency,
  });
}




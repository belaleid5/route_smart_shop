import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:route_smart/core/errors/api_error_handler.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/features/checkout/data/data_source/stripe_remote_datasource.dart';
import 'package:route_smart/features/checkout/data/models/stripe_models.dart';
import 'package:route_smart/features/checkout/domain/repo/stripe_repository.dart';

class StripeRepositoryImpl implements StripeRepository {
  final StripeRemoteDataSource _remote;

  StripeRepositoryImpl(this._remote);

  @override
  Future<ApiResult<bool>> makePayment({
    required double amount,
    String currency = 'usd',
  }) async {
    try {
      debugPrint(
        '💳 StripeRepo: creating payment intent amount=$amount currency=$currency',
      );

      // Step 1: Create payment intent & get clientSecret
      final paymentIntent = await _remote.createPaymentIntent(
        amount: (amount * 100).toInt(),
        currency: currency,
      );

      debugPrint('💳 StripeRepo: clientSecret=${paymentIntent.clientSecret}');

      if (paymentIntent.clientSecret == null) {
        debugPrint('🔴 StripeRepo: clientSecret is null');
        return  ApiResult.failure('Failed to create payment intent');
      }

      // Step 2: Init payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent.clientSecret!,
          merchantDisplayName: 'Route Smart',
          style: ThemeMode.system,
        ),
      );

      // Step 3: Present payment sheet to user
      await Stripe.instance.presentPaymentSheet();

      debugPrint('✅ StripeRepo: payment sheet completed');
      return  ApiResult.success(true);
    } on StripeException catch (e) {
      debugPrint('🔴 StripeException: ${e.error.code} - ${e.error.localizedMessage}');
      if (e.error.code == FailureCode.Canceled) {
        return  ApiResult.failure('Payment cancelled');
      }
      return ApiResult.failure(e.error.localizedMessage ?? 'Payment failed');
    } on DioException catch (e) {
      final msg = _handleDioError(e);
      debugPrint('🔴 StripeRepo DioException: $msg\nresponse: ${e.response?.data}');
      return ApiResult.failure(msg);
    } catch (e, st) {
      debugPrint('🔴 StripeRepo unknown exception: $e\n$st');
      return ApiResult.failure(
        ErrorHandler.handle(e).apiErrorModel.message ?? 'Payment failed',
      );
    }
  }

  String _handleDioError(DioException e) {
    debugPrint('🔴 DioException type: ${e.type}');
    debugPrint('🔴 DioException response: ${e.response?.data}');
    debugPrint('🔴 DioException status: ${e.response?.statusCode}');

    if (e.response?.data != null) {
      try {
        final stripeError = StripeErrorModel.fromJson(
          e.response!.data as Map<String, dynamic>,
        );
        return stripeError.message ?? 'Payment failed';
      } catch (_) {}
    }
    return ErrorHandler.handle(e).apiErrorModel.message ?? 'Payment failed';
  }
}
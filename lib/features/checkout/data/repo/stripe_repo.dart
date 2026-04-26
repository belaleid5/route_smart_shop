import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:route_smart/core/errors/api_error_handler.dart';
import 'package:route_smart/core/services/api/api_result.dart';
import 'package:route_smart/core/styles/colors/colors_light.dart';
import 'package:route_smart/features/checkout/data/data_source/stripe_data_source.dart';
import 'package:route_smart/features/checkout/data/models/stripe/payment_amount_model.dart';
import 'package:route_smart/features/checkout/data/models/stripe/stripe_error_model.dart';

class StripeRepository {
  final StripeRemoteDataSource _remote;

  StripeRepository(this._remote);

  Future<ApiResult<bool>> makePayment({
    required double amount,
    String currency = 'usd',
    String merchantName = 'Route Smart',
  }) async {
    try {
      final clientSecret = await createPaymentIntent(
        amount: amount,
        currency: currency,
      );

      if (clientSecret == null) {
        return const ApiResult.failure('Failed to initialize payment');
      }

      await initPaymentSheet(
        clientSecret: clientSecret,
        merchantName: merchantName,
      );

      await presentPaymentSheet();

      return const ApiResult.success(true);
    } on StripeException catch (e) {
      return ApiResult.failure(handleStripeException(e));
    } on DioException catch (e) {
      return ApiResult.failure(handleDioError(e));
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler.handle(e).apiErrorModel.message ?? 'Payment failed',
      );
    }
  }

  Future<String?> createPaymentIntent({
    required double amount,
    required String currency,
  }) async {
    final payment = PaymentAmountModel.fromAmount(
      amount: amount,
      currency: currency,
    );

    final response = await _remote.createPaymentIntent(payment);
    return response.clientSecret;
  }

  Future<void> initPaymentSheet({
    required String clientSecret,
    required String merchantName,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: merchantName,
        style: ThemeMode.light,

        // ✅ Customize Appearance
        appearance: PaymentSheetAppearance(
          colors: PaymentSheetAppearanceColors(
            primary: AppColorsLight.primary,
            background: AppColorsLight.shades,
            componentBackground: AppColorsLight.fieldBackground,
            componentBorder: AppColorsLight.stroke,
            componentDivider: AppColorsLight.divider,
            primaryText: AppColorsLight.textPrimary,
            secondaryText: AppColorsLight.textSecondary,
            componentText: AppColorsLight.textPrimary,
            placeholderText: AppColorsLight.textSecondary,
            icon: AppColorsLight.icon,
            error: const Color(0xFFEF4444),
          ),
          shapes: const PaymentSheetShape(
            borderRadius: 16,
            shadow: PaymentSheetShadowParams(
              color: Color(0x1A000000),
            ),
          ),
          primaryButton: const PaymentSheetPrimaryButtonAppearance(
            colors: PaymentSheetPrimaryButtonTheme(
              light: PaymentSheetPrimaryButtonThemeColors(
                background: AppColorsLight.button,
                text: Colors.white,
                border: Colors.transparent,
              ),
            ),
            shapes: PaymentSheetPrimaryButtonShape(
              blurRadius: 28,
            ),
          ),
        ),

        billingDetailsCollectionConfiguration:
            const BillingDetailsCollectionConfiguration(
          name: CollectionMode.never,
          email: CollectionMode.never,
          phone: CollectionMode.never,
          address: AddressCollectionMode.never,
        ),
      ),
    );
  }

  Future<void> presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  String handleStripeException(StripeException e) {
    if (e.error.code == FailureCode.Canceled) {
      return 'Payment was canceled';
    }
    return e.error.localizedMessage ?? 'Payment failed';
  }

  String handleDioError(DioException e) {
    if (e.response?.data != null) {
      try {
        final stripeError = StripeErrorModel.fromJson(
          e.response!.data as Map<String, dynamic>,
        );
        return stripeError.error?.message ?? 'Payment failed';
      } catch (_) {
        return ErrorHandler.handle(e).apiErrorModel.message ?? 'Payment failed';
      }
    }
    return ErrorHandler.handle(e).apiErrorModel.message ?? 'Payment failed';
  }
}
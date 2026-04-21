// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StripeErrorModel _$StripeErrorModelFromJson(Map<String, dynamic> json) =>
    StripeErrorModel(
      error: json['error'] == null
          ? null
          : StripeErrorDetails.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StripeErrorModelToJson(StripeErrorModel instance) =>
    <String, dynamic>{'error': instance.error};

StripeErrorDetails _$StripeErrorDetailsFromJson(Map<String, dynamic> json) =>
    StripeErrorDetails(
      message: json['message'] as String?,
      type: json['type'] as String?,
      code: json['code'] as String?,
      docUrl: json['doc_url'] as String?,
      param: json['param'] as String?,
    );

Map<String, dynamic> _$StripeErrorDetailsToJson(StripeErrorDetails instance) =>
    <String, dynamic>{
      'message': instance.message,
      'type': instance.type,
      'code': instance.code,
      'doc_url': instance.docUrl,
      'param': instance.param,
    };

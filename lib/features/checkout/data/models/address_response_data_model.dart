// lib/features/checkout/data/models/address_response_data_model.dart

import 'address_data_model.dart';

class AddressResponseDataModel {
  final String? status;
  final String? message;
  final int? results;
  final List<AddressDataModel>? data;

  const AddressResponseDataModel({
    this.status,
    this.message,
    this.results,
    this.data,
  });

  factory AddressResponseDataModel.fromJson(Map<String, dynamic> json) {
    return AddressResponseDataModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      results: json['results'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AddressDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

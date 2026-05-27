// core/common/data/model/product_response_model.dart

import 'package:route_smart/core/common/data/model/meta_data_model.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';

class ProductResponseModel {
  const ProductResponseModel({
    this.results,
    this.metadata,
    this.data,
  });

  final int? results;
  final PaginationMetadataModel? metadata;
  final List<ProductDataModel>? data;

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : PaginationMetadataModel.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
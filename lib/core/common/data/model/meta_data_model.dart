import 'package:route_smart/core/common/domain/entites/pagination_metadata_entity.dart';

class PaginationMetadataModel extends PaginationMetadataEntity {
  const PaginationMetadataModel({
    required super.currentPage,
    required super.numberOfPages,
  });

  factory PaginationMetadataModel.fromJson(Map<String, dynamic> json) {
    return PaginationMetadataModel(
      currentPage: json['currentPage'] as int? ?? 1,
      numberOfPages: json['numberOfPages'] as int? ?? 1,
    );
  }
}
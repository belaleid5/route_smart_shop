// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_metadata_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsMetadataModel _$ReviewsMetadataModelFromJson(
  Map<String, dynamic> json,
) => ReviewsMetadataModel(
  currentPage: (json['currentPage'] as num).toInt(),
  numberOfPages: (json['numberOfPages'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  nextPage: (json['nextPage'] as num?)?.toInt(),
);

Map<String, dynamic> _$ReviewsMetadataModelToJson(
  ReviewsMetadataModel instance,
) => <String, dynamic>{
  'currentPage': instance.currentPage,
  'numberOfPages': instance.numberOfPages,
  'limit': instance.limit,
  'nextPage': instance.nextPage,
};

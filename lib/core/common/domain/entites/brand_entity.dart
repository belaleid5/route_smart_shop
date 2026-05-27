// core/common/domain/entities/brand_entity.dart

class BrandEntity {
  const BrandEntity({
    required this.id,
    required this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrandEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
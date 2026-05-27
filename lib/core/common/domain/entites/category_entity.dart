// core/common/domain/entities/category_entity.dart

class CategoryEntity {
  const CategoryEntity({
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
      other is CategoryEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
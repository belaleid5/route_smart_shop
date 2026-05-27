class SubcategoryResponseModel {
  final int? results;
  final List<Subcategory>? data;

  const SubcategoryResponseModel({
    this.results,
    this.data,
  });

  factory SubcategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return SubcategoryResponseModel(
      results: json['results'] as int?,
      data: json['data'] != null
          ? (json['data'] as List)
              .map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (results != null) 'results': results,
      if (data != null) 'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class Subcategory {
  final String? id;
  final String? name;
  final String? slug;
  final String? category;

  const Subcategory({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      category: json['category'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) '_id': id,
      if (name != null) 'name': name,
      if (slug != null) 'slug': slug,
      if (category != null) 'category': category,
    };
  }
}

class Brand {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  const Brand({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) '_id': id,
      if (name != null) 'name': name,
      if (slug != null) 'slug': slug,
      if (image != null) 'image': image,
    };
  }
}
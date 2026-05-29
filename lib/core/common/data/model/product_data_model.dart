import 'package:route_smart/core/common/domain/entites/brand_entity.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/core/common/domain/entites/product_entity.dart';
import 'package:route_smart/features/home/data/models/sub_category_response_model.dart';

class ProductDataModel {
  final int? sold;
  final List<String>? images;
  final List<SubcategoryResponseModel>? subcategory;
  final int? ratingsQuantity;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final num? price;
  final num? priceAfterDiscount;
  final String? imageCover;
  final List<String>? availableColors;
  final CategoryModel? category;
  final BrandModel? brand;
  final double? ratingsAverage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProductDataModel({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.priceAfterDiscount,
    this.imageCover,
    this.availableColors,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      sold: (json['sold'] as num?)?.toInt(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      subcategory: (json['subcategory'] as List<dynamic>?)
          ?.map((e) =>
              SubcategoryResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratingsQuantity: (json['ratingsQuantity'] as num?)?.toInt(),
      id: json['_id'] as String? ?? json['id'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      price: json['price'] as num?,
      priceAfterDiscount: json['priceAfterDiscount'] as num?,
      imageCover: json['imageCover'] as String?,
      availableColors: (json['availableColors'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'sold': sold,
        'images': images,
        'subcategory': subcategory?.map((e) => e.toJson()).toList(),
        'ratingsQuantity': ratingsQuantity,
        '_id': id,
        'title': title,
        'slug': slug,
        'description': description,
        'quantity': quantity,
        'price': price,
        'priceAfterDiscount': priceAfterDiscount,
        'imageCover': imageCover,
        'availableColors': availableColors,
        'category': category?.toJson(),
        'brand': brand?.toJson(),
        'ratingsAverage': ratingsAverage,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  bool get hasDiscount =>
      priceAfterDiscount != null && priceAfterDiscount! < (price ?? 0);

  num get finalPrice => priceAfterDiscount ?? price ?? 0;

  int get discountPercentage {
    if (!hasDiscount || price == null || price == 0) return 0;
    return (((price! - priceAfterDiscount!) / price!) * 100).round();
  }

  ProductEntity toEntity() => ProductEntity(
        id: id ?? '',
        title: title ?? '',
        price: (price ?? 0).toDouble(),
        priceAfterDiscount: priceAfterDiscount?.toDouble(),
        description: description,
        slug: slug,
        imageCover: imageCover,
        images: images ?? [],
        availableColors: availableColors ?? [],
        quantity: quantity,
        sold: sold,
        ratingsAverage: ratingsAverage,
        ratingsQuantity: ratingsQuantity,
        createdAt: createdAt,
        updatedAt: updatedAt,
        category: category == null
            ? null
            : CategoryEntity(
                id: category!.id ?? '',
                name: category!.name ?? '',
                slug: category!.slug,
                image: category!.image,
              ),
        brand: brand == null
            ? null
            : BrandEntity(
                id: brand!.id ?? '',
                name: brand!.name ?? '',
                slug: brand!.slug,
                image: brand!.image,
              ),
      );
}

class CategoryModel {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  CategoryModel({this.id, this.name, this.slug, this.image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'slug': slug,
        'image': image,
      };
}

class BrandModel {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  BrandModel({this.id, this.name, this.slug, this.image});

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'slug': slug,
        'image': image,
      };
}
import 'package:flutter/material.dart';
import 'package:route_smart/features/search/presention/refactors/filtred_body.dart';

class FilterCategoriesPage extends StatelessWidget {
  final String title;
  final String? categoryId;
  final String? brandId;

  const FilterCategoriesPage({
    super.key,
    required this.title,
    this.categoryId,
    this.brandId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FilteredProductsBody(
        title: title,
        categoryId: categoryId,
        brandId: brandId,
      ),
    );
  }
}
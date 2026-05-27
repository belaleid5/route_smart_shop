import 'package:flutter/material.dart';
import 'package:route_smart/features/category_details/domain/entites/subcategory_entity.dart';

import 'subcategory_card.dart';

class SubcategoryGrid extends StatelessWidget {
  final List<SubcategoryEntity> subcategories;

  const SubcategoryGrid({super.key, required this.subcategories});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: subcategories.length,
      itemBuilder: (_, index) =>
          SubcategoryCard(subcategory: subcategories[index]),
    );
  }
}

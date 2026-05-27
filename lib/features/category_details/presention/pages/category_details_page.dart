// lib/features/category_details/presentation/pages/category_details_page.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/features/category_details/presention/refactors/category_details_body.dart';

class CategoryDetailsPage extends StatelessWidget {
  const CategoryDetailsPage({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: context.colors.background,
        elevation: 0,
        centerTitle: true,
      ),
      body: const CategoryDetailsBody(),
    );
  }
}

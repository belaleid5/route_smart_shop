import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/features/search/presention/refactors/filtred_body.dart';


class FilteredProductsPage extends StatelessWidget {
  const FilteredProductsPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: FilteredProductsBody(title: title),
    );
  }
}
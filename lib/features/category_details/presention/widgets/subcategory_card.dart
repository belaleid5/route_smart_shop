import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/category_details/domain/entites/subcategory_entity.dart';

class SubcategoryCard extends StatelessWidget {
  const SubcategoryCard({
    super.key,
    required this.subcategory,
  });

  final SubcategoryEntity subcategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.secondary,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: context.colors.stroke,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.category_rounded,
                size: 40,
                color: context.colors.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              subcategory.name,
              textAlign: TextAlign.center,
              style: context.textStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
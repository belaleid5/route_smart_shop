import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/search/presention/widgets/menu_header.dart';
import 'package:route_smart/features/search/presention/widgets/search_category_menu_item.dart';

class MenuContent extends StatelessWidget {
  const MenuContent({
    super.key,
    required this.categories,
    required this.selectedId,
    required this.onSelected,
  });

  final List<CategoryEntity> categories;
  final String? selectedId;
  final ValueChanged<String?> onSelected;

  static const double _menuWidth = 230;
  static const double _maxHeight = 340;
  static const double _borderRadius = 20;
  static const double _itemSpacing = 4;
  static const double _bottomSpacing = 6;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12,
      shadowColor: Colors.black.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(_borderRadius),
      color: context.colors.surface,
      child: Container(
        width: _menuWidth,
        constraints: const BoxConstraints(maxHeight: _maxHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const MenuHeader(),

      
            Divider(
              height: 1,
              thickness: 1,
              color: context.colors.stroke.withValues(alpha: 0.5),
            ),

          
            Flexible(
              child: ListView(
                padding: const EdgeInsetsDirectional.only(
                  start: 16,
                  end: 8,
                  top: 6,
                  bottom: 6,
                ),
                shrinkWrap: true,
                children: [
                  SearchCategoryMenuItem(
                    label: context.translate(LangKeys.allCategories),
                    isSelected: selectedId == null,
                    icon: Icons.apps_rounded,
                    onTap: () => onSelected(null),
                  ),

                  verticalSpace(_itemSpacing),

                  ..._buildCategoryItems(),
                ],
              ),
            ),

            verticalSpace(_bottomSpacing),
          ],
        ),
      ),
    );
  }


  List<Widget> _buildCategoryItems() {
    final items = <Widget>[];

    for (int i = 0; i < categories.length; i++) {
      final cat = categories[i];

      items.add(
        SearchCategoryMenuItem(
          label: cat.name,
          isSelected: selectedId == cat.id,
          onTap: () => onSelected(
           
            selectedId == cat.id ? null : cat.id,
          ),
        ),
      );

     
      if (i < categories.length - 1) {
        items.add(verticalSpace(_itemSpacing));
      }
    }

    return items;
  }
}
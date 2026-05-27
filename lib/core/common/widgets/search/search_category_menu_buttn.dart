import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';
import 'package:route_smart/features/search/presention/widgets/search_category_menu_overlay.dart';

class SearchCategoryMenuButton extends StatefulWidget {
  const SearchCategoryMenuButton({
    super.key,
    required this.categories,
    required this.selectedId,
    required this.onSelected,
  });

  final List<CategoryEntity> categories;
  final String? selectedId;
  final ValueChanged<String?> onSelected;

  @override
  State<SearchCategoryMenuButton> createState() =>
      _SearchCategoryMenuButtonState();
}

class _SearchCategoryMenuButtonState extends State<SearchCategoryMenuButton> {
  final _key = GlobalKey();
  bool _isOpen = false;

  String _getLabel(BuildContext context) {
    if (widget.selectedId == null || widget.categories.isEmpty) {
      return context.translate(LangKeys.all);
    }
    final category = widget.categories.firstWhere(
      (c) => c.id == widget.selectedId,
      orElse: () => widget.categories.first,
    );
    return category.name.split(' ').first;
  }

  Future<void> _showMenu() async {
    if (widget.categories.isEmpty) return;
    final renderBox = _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null || !mounted) return;

    setState(() => _isOpen = true);

    await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (_, __, ___) => SearchCategoryMenuOverlay(
          categories: widget.categories,
          selectedId: widget.selectedId,
          onSelected: widget.onSelected,
          buttonRenderBox: renderBox,
        ),
      ),
    );

    if (mounted) setState(() => _isOpen = false);
  }

  @override
  Widget build(BuildContext context) {
    final label = _getLabel(context);

    return GestureDetector(
      key: _key,
      onTap: _showMenu,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutCubic,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: context.colors.primary,
        ),
        child: Row(
          spacing: 4,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: context.bodyMedium.copyWith(
                fontWeight: FontWeightHelper.semiBold,
                color: Colors.white,
                letterSpacing: -0.2,
              ),
            ),
            AnimatedRotation(
              turns: _isOpen ? 0.5 : 0,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOutCubic,
              child: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
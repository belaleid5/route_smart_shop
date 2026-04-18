import 'package:flutter/material.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';
import 'package:route_smart/features/search/presention/widgets/search_category_menu_overlay.dart';

class SearchCategoryMenuButton extends StatefulWidget {
  const SearchCategoryMenuButton({
    super.key,
    required this.categories,
    required this.selectedId,
    required this.onSelected,
  });

  final List<CategoryData> categories;
  final String? selectedId;
  final ValueChanged<String?> onSelected;

  @override
  State<SearchCategoryMenuButton> createState() =>
      _SearchCategoryMenuButtonState();
}

class _SearchCategoryMenuButtonState extends State<SearchCategoryMenuButton> {
  final _key = GlobalKey();
  bool _isOpen = false;

  // ─── Label ────────────────────────────────────────────────────────────────
  String get _label {
    if (widget.selectedId == null) return 'All';
    return widget.categories
            .where((c) => c.id == widget.selectedId)
            .firstOrNull
            !.name
            !.split(' ')
            .first;
  }

  // ─── Show Menu ────────────────────────────────────────────────────────────
  Future<void> _showMenu() async {
    if (widget.categories.isEmpty) return;
    final renderBox = _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

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
    return GestureDetector(
      key: _key,
      onTap: _showMenu,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutCubic,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: context.color.primary,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _label,
              style: context.textStyle.copyWith(
                fontSize: 13,
                fontWeight: FontWeightHelper.semiBold,
                color: Colors.white,
                letterSpacing: -0.2,
              ),
            ),
            const SizedBox(width: 4),
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

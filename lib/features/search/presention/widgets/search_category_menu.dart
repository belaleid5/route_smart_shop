import 'package:flutter/material.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/features/search/presention/widgets/search_bar_item.dart';
import 'package:route_smart/features/search/presention/widgets/search_category_menu_overlay.dart';

class SearchCategoryMenu extends StatefulWidget {
  const SearchCategoryMenu({
    super.key,
    required this.categories,
    required this.selectedId,
    required this.onSelected,
  });

  final List<CategoryData> categories;
  final String? selectedId;
  final ValueChanged<String?> onSelected;

  @override
  State<SearchCategoryMenu> createState() => _SearchCategoryMenuState();
}

class _SearchCategoryMenuState extends State<SearchCategoryMenu> {
  final _buttonKey = GlobalKey();
  bool _isMenuOpen = false;

  String get _selectedLabel {
    if (widget.selectedId == null) return 'All Categories';
    return widget.categories
            .where((c) => c.id == widget.selectedId)
            .firstOrNull
            ?.name ??
        'All Categories';
  }

  bool get _isSelected => widget.selectedId != null;

  Future<void> _showMenu() async {
    if (widget.categories.isEmpty) return;

    final renderBox =
        _buttonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    setState(() => _isMenuOpen = true);

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

    if (mounted) setState(() => _isMenuOpen = false);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _buttonKey,
      child: SearchFilterBarItem(
        label: _selectedLabel,
        icon: Icons.category_outlined,
        isSelected: _isSelected || _isMenuOpen,
        onTap: _showMenu,
      ),
    );
  }
}
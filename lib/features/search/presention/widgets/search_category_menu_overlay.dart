import 'package:flutter/material.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';
import 'package:route_smart/features/search/presention/widgets/search_category_menu_item.dart';

class SearchCategoryMenuOverlay extends StatefulWidget {
  const SearchCategoryMenuOverlay({
    super.key,
    required this.categories,
    required this.selectedId,
    required this.onSelected,
    required this.buttonRenderBox,
  });

  final List<CategoryData> categories;
  final String? selectedId;
  final ValueChanged<String?> onSelected;
  final RenderBox buttonRenderBox;

  @override
  State<SearchCategoryMenuOverlay> createState() =>
      _SearchCategoryMenuOverlayState();
}

class _SearchCategoryMenuOverlayState extends State<SearchCategoryMenuOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;
  late final Offset _buttonPosition;
  late final Size _buttonSize;

  @override
  void initState() {
    super.initState();
    _buttonPosition = widget.buttonRenderBox.localToGlobal(Offset.zero);
    _buttonSize = widget.buttonRenderBox.size;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _dismiss() async {
    await _controller.reverse();
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _dismiss,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        children: [
          Positioned(
            top: _buttonPosition.dy + _buttonSize.height + 8,
            left: _buttonPosition.dx,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                alignment: Alignment.topLeft,
                child: _MenuContent(
                  categories: widget.categories,
                  selectedId: widget.selectedId,
                  onSelected: (id) {
                    widget.onSelected(id);
                    _dismiss();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Menu Content ──────────────────────────────────────────────────────────────
class _MenuContent extends StatelessWidget {
  const _MenuContent({
    required this.categories,
    required this.selectedId,
    required this.onSelected,
  });

  final List<CategoryData> categories;
  final String? selectedId;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12,
      shadowColor: Colors.black.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(20),
      color: context.color.white,
      child: Container(
        width: 230,
        constraints: const BoxConstraints(maxHeight: 340),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Header ────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
              child: Row(
                children: [
                  Icon(
                    Icons.category_outlined,
                    size: 16,
                    color: context.color.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Categories',
                    style: context.textStyle.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeightHelper.semiBold,
                      color: context.color.textPrimary,
                    ),
                  ),
                ],
              ),
            ),

            Divider(
              height: 1,
              thickness: 1,
              color: context.color.stroke.withValues(alpha: 0.5),
            ),

            // ── List ──────────────────────────────────────────────────────
            Flexible(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 6,
                ),
                shrinkWrap: true,
                children: [
                  // ── All Option ──────────────────────────────────────────
                  SearchCategoryMenuItem(
                    label: 'All Categories',
                    isSelected: selectedId == null,
                    icon: Icons.apps_rounded,
                    onTap: () => onSelected(null),
                  ),

                  const SizedBox(height: 4),

                  // ── Categories ──────────────────────────────────────────
                  ...categories.map(
                    (cat) => SearchCategoryMenuItem(
                      label: cat.name,
                      isSelected: selectedId == cat.id,
                      onTap: () => onSelected(
                        selectedId == cat.id ? null : cat.id,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
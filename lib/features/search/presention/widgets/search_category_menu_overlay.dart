import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:route_smart/core/common/domain/entites/category_entity.dart';
import 'package:route_smart/features/search/presention/widgets/menu_content.dart';

class SearchCategoryMenuOverlay extends StatefulWidget {
  const SearchCategoryMenuOverlay({
    super.key,
    required this.categories,
    required this.selectedId,
    required this.onSelected,
    required this.buttonRenderBox,
  });

  final List<CategoryEntity> categories;
  final String? selectedId;
  final ValueChanged<String?> onSelected;
  final RenderBox buttonRenderBox;

  @override
  State<SearchCategoryMenuOverlay> createState() =>
      _SearchCategoryMenuOverlayState();
}

class _SearchCategoryMenuOverlayState extends State<SearchCategoryMenuOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _exitController;
  late final Offset _buttonPosition;
  late final Size _buttonSize;

  bool _isDismissing = false;

  static const _menuWidth = 230.0;
  static const _menuTopGap = 8.0;
  static const _edgePadding = 16.0;
  static const _enterDuration = Duration(milliseconds: 350);
  static const _exitDuration = Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    _buttonPosition = widget.buttonRenderBox.localToGlobal(Offset.zero);
    _buttonSize = widget.buttonRenderBox.size;
    _exitController = AnimationController(
      vsync: this,
      duration: _exitDuration,
    );
  }

  @override
  void dispose() {
    _exitController.dispose();
    super.dispose();
  }

  Future<void> _dismiss() async {
    if (_isDismissing) return;
    _isDismissing = true;
    await _exitController.forward();
    if (mounted) Navigator.of(context).pop();
  }

  double _menuLeft(double screenWidth) {
    final maxLeft = screenWidth - _edgePadding - _menuWidth;
    return _buttonPosition.dx.clamp(_edgePadding, maxLeft);
  }

  Alignment _menuAlignment(double left, double screenWidth) {
    return (left + _menuWidth / 2) < screenWidth / 2
        ? Alignment.topLeft
        : Alignment.topRight;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final left = _menuLeft(screenWidth);
    final alignment = _menuAlignment(left, screenWidth);

    return GestureDetector(
      onTap: _dismiss,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        children: [
          _Backdrop(controller: _exitController),
          Positioned(
            top: _buttonPosition.dy + _buttonSize.height + _menuTopGap,
            left: left,
            child: _MenuAnimated(
              exitController: _exitController,
              enterDuration: _enterDuration,
              alignment: alignment,
              child: _MenuCard(
                categories: widget.categories,
                selectedId: widget.selectedId,
                onSelected: (id) {
                  widget.onSelected(id);
                  _dismiss();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Backdrop extends StatelessWidget {
  const _Backdrop({required this.controller});

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) => Opacity(
        opacity: (1 - controller.value).clamp(0.0, 1.0) * 0.15,
        child: const ColoredBox(
          color: Colors.black,
          child: SizedBox.expand(),
        ),
      ),
    );
  }
}

class _MenuAnimated extends StatelessWidget {
  const _MenuAnimated({
    required this.exitController,
    required this.enterDuration,
    required this.alignment,
    required this.child,
  });

  final AnimationController exitController;
  final Duration enterDuration;
  final Alignment alignment;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final entered = child
        .animate()
        .fadeIn(duration: enterDuration, curve: Curves.easeOut)
        .scaleXY(
          begin: 0.85,
          end: 1.0,
          duration: enterDuration,
          curve: Curves.easeOutBack,
          alignment: alignment,
        )
        .moveY(
          begin: -12,
          end: 0,
          duration: enterDuration,
          curve: Curves.easeOutCubic,
        )
        .blur(
          begin: const Offset(4, 4),
          end: Offset.zero,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );

    return AnimatedBuilder(
      animation: exitController,
      builder: (_, __) {
        final t = exitController.value;
        return Opacity(
          opacity: (1 - t).clamp(0.0, 1.0),
          child: Transform.scale(
            scale: 1 - t * 0.1,
            alignment: alignment,
            child: Transform.translate(
              offset: Offset(0, -t * 8),
              child: entered,
            ),
          ),
        );
      },
    );
  }
}

class _MenuCard extends StatelessWidget {
  const _MenuCard({
    required this.categories,
    required this.selectedId,
    required this.onSelected,
  });

  final List<CategoryEntity> categories;
  final String? selectedId;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 24,
            spreadRadius: 4,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: MenuContent(
        categories: categories,
        selectedId: selectedId,
        onSelected: onSelected,
      ),
    );
  }
}
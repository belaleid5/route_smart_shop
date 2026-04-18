import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';

class SearchFilterBottomSheet extends StatefulWidget {
  const SearchFilterBottomSheet({
    super.key,
    required this.params,
    required this.onApply,
  });

  final SearchFilterParams params;
  final ValueChanged<SearchFilterParams> onApply;

  @override
  State<SearchFilterBottomSheet> createState() =>
      _SearchFilterBottomSheetState();
}

class _SearchFilterBottomSheetState extends State<SearchFilterBottomSheet> {
  late String? _selectedSort;

  // ── Sort Options ───────────────────────────────────────────────────────────
  static const _sortOptions = [
    (label: 'Default', value: null, icon: Icons.sort_rounded),
    (label: 'A → Z', value: 'title', icon: Icons.sort_by_alpha_rounded),
    (label: 'Z → A', value: '-title', icon: Icons.sort_by_alpha_rounded),
    (label: 'Price ↑', value: 'price', icon: Icons.arrow_upward_rounded),
    (label: 'Price ↓', value: '-price', icon: Icons.arrow_downward_rounded),
  ];

  @override
  void initState() {
    super.initState();
    _selectedSort = widget.params.sort;
  }

  // ─── Actions ───────────────────────────────────────────────────────────────
  void _apply() {
    widget.onApply(widget.params.copyWith(sort: _selectedSort));
    Navigator.pop(context);
  }

  void _reset() {
    setState(() => _selectedSort = null);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      decoration: BoxDecoration(
        color: context.color.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Handle ──────────────────────────────────────────────────────
          const _BottomSheetHandle(),

          verticalSpace(20),

          // ── Header ──────────────────────────────────────────────────────
          _BottomSheetHeader(onReset: _reset),

          verticalSpace(20),

          // ── Sort Title ───────────────────────────────────────────────────
          const _SectionTitle(icon: Icons.swap_vert_rounded, title: 'Sort By'),

          verticalSpace(12),

          // ── Sort Chips ───────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _sortOptions
                .map(
                  (opt) => _SortChip(
                    label: opt.label,
                    icon: opt.icon,
                    isSelected: _selectedSort == opt.value,
                    onTap: () => setState(() => _selectedSort = opt.value),
                  ),
                )
                .toList(),
          ),

          verticalSpace(24),

          // ── Apply Button ─────────────────────────────────────────────────
          _ApplyButton(onApply: _apply),
        ],
      ),
    );
  }
}

// ─── Handle ────────────────────────────────────────────────────────────────────
class _BottomSheetHandle extends StatelessWidget {
  const _BottomSheetHandle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: context.color.stroke,
        ),
      ),
    );
  }
}

// ─── Header ────────────────────────────────────────────────────────────────────
class _BottomSheetHeader extends StatelessWidget {
  const _BottomSheetHeader({required this.onReset});

  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Filters',
          style: context.textStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeightHelper.bold,
            color: context.color.textPrimary,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onReset,
          child: Text(
            'Reset',
            style: context.textStyle.copyWith(
              fontSize: 13,
              fontWeight: FontWeightHelper.medium,
              color: context.color.primary,
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Section Title ─────────────────────────────────────────────────────────────
class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: context.color.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: context.textStyle.copyWith(
            fontSize: 15,
            fontWeight: FontWeightHelper.semiBold,
            color: context.color.textPrimary,
          ),
        ),
      ],
    );
  }
}

// ─── Sort Chip ─────────────────────────────────────────────────────────────────
class _SortChip extends StatelessWidget {
  const _SortChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isSelected ? context.color.primary : context.color.white,
          border: Border.all(
            color: isSelected ? context.color.primary : context.color.stroke,
            width: isSelected ? 1.5 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: context.color.primary.withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Icon ────────────────────────────────────────────────────
            Icon(
              icon,
              size: 14,
              color: isSelected
                  ? Colors.white
                  : context.color.textPrimary.withValues(alpha: 0.6),
            ),

            const SizedBox(width: 6),

            // ── Label ───────────────────────────────────────────────────
            Text(
              label,
              style: context.textStyle.copyWith(
                fontSize: 13,
                fontWeight: isSelected
                    ? FontWeightHelper.semiBold
                    : FontWeightHelper.medium,
                color: isSelected ? Colors.white : context.color.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Apply Button ──────────────────────────────────────────────────────────────
class _ApplyButton extends StatelessWidget {
  const _ApplyButton({required this.onApply});

  final VoidCallback onApply;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onApply,
        style: ElevatedButton.styleFrom(
          backgroundColor: context.color.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Text(
          'Apply Filters',
          style: context.textStyle.copyWith(
            fontSize: 15,
            fontWeight: FontWeightHelper.semiBold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

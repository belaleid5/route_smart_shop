import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/search/domain/entites/search_params.dart';
import 'package:route_smart/features/search/presention/widgets/apply_button.dart';
import 'package:route_smart/features/search/presention/widgets/bottom_sheet_handle.dart';
import 'package:route_smart/features/search/presention/widgets/bottom_sheet_header.dart';
import 'package:route_smart/features/search/presention/widgets/section_title.dart';
import 'package:route_smart/features/search/presention/widgets/sort_chip.dart';

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

  static const _sortOptions = [
    (
      labelKey: LangKeys.sortDefault,
      value: null,
      icon: Icons.sort_rounded,
    ),
    (
      labelKey: LangKeys.sortAToZ,
      value: 'title',
      icon: Icons.sort_by_alpha_rounded,
    ),
    (
      labelKey: LangKeys.sortZToA,
      value: '-title',
      icon: Icons.sort_by_alpha_rounded,
    ),
    (
      labelKey: LangKeys.sortPriceLow,
      value: 'price',
      icon: Icons.arrow_upward_rounded,
    ),
    (
      labelKey: LangKeys.sortPriceHigh,
      value: '-price',
      icon: Icons.arrow_downward_rounded,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _selectedSort = widget.params.sort;
  }

  void _apply() {
    widget.onApply(widget.params.copyWith(sort: _selectedSort));
    context.pop();
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
        color: context.colors.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BottomSheetHandle(),
          verticalSpace(20),
          BottomSheetHeader(onReset: _reset),
          verticalSpace(20),
          SectionTitle(
            icon: Icons.swap_vert_rounded,
            title: context.translate(LangKeys.sortBy),
          ),
          verticalSpace(12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _sortOptions
                .map(
                  (option) => SortChip(
                    label: context.translate(option.labelKey),
                    icon: option.icon,
                    isSelected: _selectedSort == option.value,
                    onTap: () {
                      setState(() => _selectedSort = option.value);
                    },
                  ),
                )
                .toList(),
          ),
          verticalSpace(24),
          ApplyButton(onApply: _apply),
        ],
      ),
    );
  }
}
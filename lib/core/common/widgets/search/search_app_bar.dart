import 'package:flutter/material.dart';
import 'package:route_smart/core/common/data/model/category_response_model.dart';
import 'package:route_smart/core/common/widgets/search/search_bar_with_filter.dart';
import 'package:route_smart/core/common/widgets/search/search_title.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    super.key,
    required this.controller,
    required this.onSearch,
    required this.onChanged,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
    required this.params,
    required this.onParamsChanged,
    required this.onCleared,
    this.showBackButton = false,
  });

  final TextEditingController controller;
  final ValueChanged<String> onSearch;
  final ValueChanged<String> onChanged;
  final List<CategoryData> categories;
  final String? selectedCategoryId;
  final ValueChanged<String?> onCategorySelected;
  final SearchFilterParams params;
  final ValueChanged<SearchFilterParams> onParamsChanged;
  final VoidCallback onCleared;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (showBackButton) ...[
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: context.color.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: context.color.stroke,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: context.color.black.withValues(alpha: 0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 18,
                      color: context.color.textPrimary,
                    ),
                  ),
                ).animateRightLeft(
                  isFromStart: true,
                  duration: const Duration(milliseconds: 300),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: const SearchTitle().animateRightLeft(
                  isFromStart: true,
                  duration: const Duration(milliseconds: 400),
                ),
              ),
            ],
          ),
          verticalSpace(16),
          SearchBarWithFilter(
            controller: controller,
            categories: categories,
            selectedCategoryId: selectedCategoryId,
            onCategorySelected: onCategorySelected,
            onChanged: onChanged,
            onSearch: onSearch,
            params: params,
            onParamsChanged: onParamsChanged,
            onCleared: onCleared,
          ).animateBottomToTop(
            duration: const Duration(milliseconds: 500),
          ),
        ],
      ),
    );
  }
}
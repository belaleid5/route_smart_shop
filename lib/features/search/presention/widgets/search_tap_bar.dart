import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/search/domain/entites/search_params.dart';
import 'package:route_smart/features/search/presention/widgets/search_tap_item.dart';

class SearchTabBar extends StatelessWidget {
  const SearchTabBar({
    super.key,
    required this.activeTab,
    required this.totalProducts,
    required this.totalBrands,
    required this.totalCategories,
    required this.onTabChanged,
  });

  final SearchTab activeTab;
  final int totalProducts;
  final int totalBrands;
  final int totalCategories;
  final ValueChanged<SearchTab> onTabChanged;

  static final List<SearchTab> _tabs = [
    SearchTab.products,
    SearchTab.brands,
    SearchTab.categories,
  ];

  int _countFor(SearchTab tab) => switch (tab) {
    SearchTab.products => totalProducts,
    SearchTab.brands => totalBrands,
    SearchTab.categories => totalCategories,
  };

  String _labelFor(BuildContext context, SearchTab tab) => switch (tab) {
    SearchTab.products => context.translate(LangKeys.products),
    SearchTab.brands => context.translate(LangKeys.brands),
    SearchTab.categories => context.translate(LangKeys.categories),
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: List.generate(_tabs.length, (index) {
          final tab = _tabs[index];
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child:
                  SearchTabItem(
                    label: _labelFor(context, tab),
                    count: _countFor(tab),
                    isActive: activeTab == tab,
                    onTap: () => onTabChanged(tab),
                  ).animateBottomToTop(
                    duration: Duration(milliseconds: 300 + (index * 60)),
                  ),
            ),
          );
        }),
      ),
    );
  }
}

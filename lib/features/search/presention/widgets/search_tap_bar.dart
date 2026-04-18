import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/features/search/presention/manger/search_params.dart';
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

  final SearchTab            activeTab;
  final int                  totalProducts;
  final int                  totalBrands;
  final int                  totalCategories;
  final ValueChanged<SearchTab> onTabChanged;

  static const List<SearchTab> _tabs = [
    SearchTab.products,
    SearchTab.brands,
    SearchTab.categories,
  ];

  int _countFor(SearchTab tab) => switch (tab) {
        SearchTab.products   => totalProducts,
        SearchTab.brands     => totalBrands,
        SearchTab.categories => totalCategories,
      };

  String _labelFor(SearchTab tab) => switch (tab) {
        SearchTab.products   => 'Products',
        SearchTab.brands     => 'Brands',
        SearchTab.categories => 'Categories',
      };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: _tabs.mapIndexed((index, tab) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SearchTabItem(
                label:    _labelFor(tab),
                count:    _countFor(tab),
                isActive: activeTab == tab,
                onTap:    () => onTabChanged(tab),
              ).animateBottomToTop(
                duration: Duration(milliseconds: 300 + (index * 60)),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ── Extension helper ───────────────────────────────────────────────────────────
extension<T> on List<T> {
  List<R> mapIndexed<R>(R Function(int index, T item) f) {
    return [
      for (int i = 0; i < length; i++) f(i, this[i]),
    ];
  }
}
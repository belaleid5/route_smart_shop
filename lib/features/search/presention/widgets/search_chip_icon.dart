// lib/features/search/presention/widgets/search_chip_icon.dart

import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class SearchChipIcon extends StatelessWidget {
  const SearchChipIcon({
    super.key,
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color    color;

  @override
  Widget build(BuildContext context) {
    return Icon(icon,
    
    
     size: 14, color: context.colors.primary);
  }
}
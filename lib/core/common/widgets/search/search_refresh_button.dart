import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class SearchRefreshButton extends StatelessWidget {
  const SearchRefreshButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        color: context.colors.primary,
          boxShadow: [
            BoxShadow(
              color: context.colors.primary,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(Icons.refresh_rounded, size: 20, color: Colors.white),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class SearchClearButton extends StatelessWidget {
  const SearchClearButton({super.key, required this.onTap});
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
          color:context.colors.primary,
          border: Border.all(color: context.colors.primary,),
        ),
        child: Icon(Icons.close_rounded, size: 18, color: context.colors.primary,),
      ),
    );
  }
}
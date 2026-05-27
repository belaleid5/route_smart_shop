import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key, required this.onDelete});

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDelete,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: context.colors.shades,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          Icons.delete_outline_rounded,
          size: 18,
          color: context.colors.textPrimary,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class ImageProduct extends StatelessWidget {
  final String? imageUrl;
  const ImageProduct({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.textSecondary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        image: DecorationImage(
          image: NetworkImage(
            imageUrl ?? 'https://via.placeholder.com/150', 
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

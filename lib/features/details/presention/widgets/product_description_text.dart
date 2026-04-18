import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class ProductDescriptionText extends StatefulWidget {
  const ProductDescriptionText({super.key, required this.description});

  final String description;

  @override
  State<ProductDescriptionText> createState() => _ProductDescriptionTextState();
}

class _ProductDescriptionTextState extends State<ProductDescriptionText> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          maxLines: expanded ? null : 3,
          overflow: expanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: context.textStyle.copyWith(
            fontSize: 14,
            color: context.color.textPrimary.withOpacity(0.6),
            height: 1.6,
          ),
        ),
        GestureDetector(
          onTap: () => setState(() => expanded = !expanded),
          child: Text(
            expanded
                ? context.translate('read_less')
                : context.translate('read_more'),
            style: context.textStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: context.color.button,
            ),
          ),
        ),
      ],
    );
  }
}

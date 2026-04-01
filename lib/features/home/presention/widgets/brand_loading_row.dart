import 'package:flutter/material.dart';
import 'package:route_smart/core/common/widgets/smooth_list_view.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class BrandsLoadingRow extends StatelessWidget {
  const BrandsLoadingRow({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: SmoothListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 4,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, __) => Container(
          width: 120,
          decoration: BoxDecoration(
            color: context.color.textSecondary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        duration: Duration(milliseconds: 1200),
      ),
    );
  }
}

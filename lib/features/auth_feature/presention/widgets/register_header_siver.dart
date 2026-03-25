import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';

class RegisterHeaderSliver extends StatelessWidget {
  const RegisterHeaderSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_bag_outlined, color: context.colors.primary),
                const SizedBox(width: 8),
                Text('Route Shop', style: context.textStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ).animateBottomToTop(),
            const SizedBox(height: 40),
            Text('Create Account', style: context.textStyle.copyWith(fontSize: 28, fontWeight: FontWeight.bold))
                .animateRightLeft(),
            const SizedBox(height: 8),
            Text('Sign up to get started', style: TextStyle(fontSize: 16, color: Colors.grey))
                .animateRightLeft(),
          ],
        ),
      ),
    );
  }
}
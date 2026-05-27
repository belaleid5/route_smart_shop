import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';

import 'package:route_smart/features/home/presention/manger/brand/brands_bloc.dart';
import 'package:route_smart/features/home/presention/manger/brand/brands_event.dart';

class BrandsErrorState extends StatelessWidget {
  final String message;

  const BrandsErrorState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 56,
            color: context.colors.textSecondary,
          ).animateShakeAlarm(),
          verticalSpace( 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: context.colors.textSecondary),
          ),
          verticalSpace( 20),
          ElevatedButton.icon(
            onPressed: () => context.read<BrandsBloc>().add(const GetBrandsEvent()),
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Retry'),
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ).animateBottomToTop(),
        ],
      ),
    );
  }
}
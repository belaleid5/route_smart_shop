import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_bloc.dart';
import 'package:route_smart/features/home/presention/manger/categroy/categories_event.dart';

class CategoriesErrorState extends StatelessWidget {
  final String message;

  const CategoriesErrorState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 64,
            color: context.colors.textSecondary,
          ).animateShakeAlarm(),
          verticalSpace( 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: context.colors.textSecondary, fontSize: 16),
          ),
          verticalSpace( 24),
          ElevatedButton.icon(
            onPressed: () => context.read<CategoriesBloc>().add(const GetCategoriesEvent()),
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Retry'),
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ).animateBottomToTop(),
        ],
      ),
    );
  }
}
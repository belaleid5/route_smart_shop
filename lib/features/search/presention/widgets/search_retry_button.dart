import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/search/presention/manger/search_bloc.dart';
import 'package:route_smart/features/search/presention/manger/search_event.dart';

class SearchRetryButton extends StatelessWidget {
  const SearchRetryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        context.read<SearchBloc>().add(const SearchEventSearch());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      icon: const Icon(Icons.refresh_rounded, size: 20),
      label: Text(
        context.translate(LangKeys.retry),
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
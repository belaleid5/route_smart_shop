// lib/features/search/presentation/widgets/search_error_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/features/search/presention/manger/search_bloc.dart';
import 'package:route_smart/features/search/presention/manger/search_event.dart';

class SearchErrorView extends StatelessWidget {
  const SearchErrorView({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchErrorMessage(message: message),
          const SizedBox(height: 16),
          SearchRetryButton(),
        ],
      ),
    );
  }
}

class SearchErrorMessage extends StatelessWidget {
  const SearchErrorMessage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(color: context.colors.textSecondary),
      textAlign: TextAlign.center,
    );
  }
}

class SearchRetryButton extends StatelessWidget {
  const SearchRetryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>
          context.read<SearchBloc>().add(const SearchEvent.search()),
      child: const Text('Retry'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/search/presention/refactors/search_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
    this.showBackButton = false,
  });

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.background,
      body: SearchBody(showBackButton: showBackButton),
    );
  }
}
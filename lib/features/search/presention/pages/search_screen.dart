import 'package:flutter/material.dart';
import 'package:route_smart/features/search/presention/refactors/search_body.dart';

class SearchScreen extends StatelessWidget {
  final bool showBackButton;
  const SearchScreen({super.key, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showBackButton
          ? AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
            )
          : null,
      body: const SearchBody(),
    );
  }
}
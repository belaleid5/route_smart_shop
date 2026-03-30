import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/features/home/presention/refacors/home_body.dart'
    show HomeBody;
import 'package:route_smart/features/home/presention/widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.white,
      appBar: const HomeAppBar(), // 1. AppBar
      body: HomeBody(),
    );
  }
}

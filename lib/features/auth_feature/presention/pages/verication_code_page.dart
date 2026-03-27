import 'package:flutter/material.dart';
import 'package:route_smart/features/auth_feature/presention/refactors/verify_code_body.dart';

class VerifyCodePage extends StatelessWidget {
  const VerifyCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VerifyCodeBody(),
    );
  }
}
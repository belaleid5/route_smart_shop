// features/auth_feature/presention/views/login_view.dart

import 'package:flutter/material.dart';
import 'package:route_smart/features/auth_feature/presention/refactors/sign_in_body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInBody(),
    );
  }
}
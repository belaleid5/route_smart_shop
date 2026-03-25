// features/auth/presentation/views/register_view.dart
import 'package:flutter/material.dart';
import 'package:route_smart/features/auth_feature/presention/refactors/register_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterBody()
    );
  }
}
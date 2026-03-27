import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_bloc.dart';
import 'package:route_smart/features/auth_feature/presention/manger/verfiy_code/verify_code_state.dart';

class BlocBuilderAuthCode extends StatelessWidget {
  const BlocBuilderAuthCode({super.key, this.onPressed});
 final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyCodeBloc, VerifyCodeState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4C53FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text(
                    'Verify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        );
      },
    );
  }
}

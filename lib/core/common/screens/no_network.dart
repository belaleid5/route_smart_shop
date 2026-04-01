import 'package:flutter/material.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/styles/app_images.dart';

class NoNetwork extends StatelessWidget {
  const NoNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.noNetwork,
              height: 100,
              width: 100,
            ), // Use your no network image here
            const SizedBox(height: 20),
             Text(
              'No Network Connection',
              style: context.textStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please check your internet settings and try again.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

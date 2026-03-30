import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BrandsError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const BrandsError({super.key, required this.message, required this.onRetry});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(message, style: const TextStyle(color: Colors.red)),
          ),
          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
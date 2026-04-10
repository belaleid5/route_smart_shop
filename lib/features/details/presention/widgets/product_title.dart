// lib/features/product_details/presentation/widgets/product_title.dart

import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

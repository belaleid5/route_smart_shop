import 'package:flutter/material.dart';

class BarcodeWidget extends StatelessWidget {
  const BarcodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: List.generate(30, (index) {
          final width = (index % 3 == 0) ? 3.0 : (index % 2 == 0 ? 1.5 : 2.0);
          final spacing = (index % 4 == 0) ? 4.0 : 2.0;

          return Row(
            children: [
              Container(width: width, height: 50, color: Colors.black),
              SizedBox(width: spacing),
            ],
          );
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTexGoTo extends StatelessWidget {
  const CustomTexGoTo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Already have an account? ', style: TextStyle(color: Colors.grey)),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Text(
              'Login',
              style: TextStyle(
                color: Color(0xFF6C63FF),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
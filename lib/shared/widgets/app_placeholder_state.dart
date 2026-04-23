import 'package:flutter/material.dart';

/// Generic placeholder state for empty pages during early scaffolding.
class AppPlaceholderState extends StatelessWidget {
  const AppPlaceholderState({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(
          color: Color(0xFF6F7483),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

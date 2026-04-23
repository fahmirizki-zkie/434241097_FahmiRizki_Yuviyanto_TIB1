import 'package:flutter/material.dart';

/// Shared text styles used by multiple widgets/pages.
abstract final class AppTextStyles {
  static const TextStyle splashTitle = TextStyle(
    color: Color(0xFF0F172A),
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
  );

  static const TextStyle splashCaption = TextStyle(
    color: Color(0xFFA2A7B1),
    fontSize: 12,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.1,
  );
}

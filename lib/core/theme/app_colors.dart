import 'package:flutter/material.dart';

/// Centralized color tokens to keep UI consistent.
abstract final class AppColors {
  // ── Brand / Accent ──
  static const Color seed = Color(0xFF4450E7);
  static const Color accent = Color(0xFF6B4EE6);

  // ── Light palette ──
  static const Color splashSurface = Color(0xFFE6E8EF);
  static const Color splashTitle = Color(0xFF0F172A);
  static const Color splashCaption = Color(0xFFA2A7B1);

  static const Color scaffoldLight = Color(0xFFF8F9FA);
  static const Color cardLight = Colors.white;
  static const Color textPrimaryLight = Color(0xFF2D3748);
  static const Color textSecondaryLight = Color(0xFF718096);
  static const Color borderLight = Color(0xFFE4E8F3);
  static const Color dividerLight = Color(0xFFE7EAF3);
  static const Color navBarLight = Colors.white;
  static const Color profileHeaderLight = Color(0xFFE8EBFB);

  // ── Dark palette ──
  static const Color splashSurfaceDark = Color(0xFF121218);
  static const Color splashTitleDark = Color(0xFFE2E8F0);
  static const Color splashCaptionDark = Color(0xFF64748B);

  static const Color scaffoldDark = Color(0xFF121218);
  static const Color cardDark = Color(0xFF1E1E2E);
  static const Color textPrimaryDark = Color(0xFFE2E8F0);
  static const Color textSecondaryDark = Color(0xFF94A3B8);
  static const Color borderDark = Color(0xFF2D3748);
  static const Color dividerDark = Color(0xFF2D3748);
  static const Color navBarDark = Color(0xFF1A1A2E);
  static const Color profileHeaderDark = Color(0xFF252547);

  // ── Helpers ──
  static Color scaffold(bool isDark) =>
      isDark ? scaffoldDark : scaffoldLight;
  static Color card(bool isDark) =>
      isDark ? cardDark : cardLight;
  static Color textPrimary(bool isDark) =>
      isDark ? textPrimaryDark : textPrimaryLight;
  static Color textSecondary(bool isDark) =>
      isDark ? textSecondaryDark : textSecondaryLight;
  static Color border(bool isDark) =>
      isDark ? borderDark : borderLight;
  static Color divider(bool isDark) =>
      isDark ? dividerDark : dividerLight;
  static Color navBar(bool isDark) =>
      isDark ? navBarDark : navBarLight;
  static Color profileHeader(bool isDark) =>
      isDark ? profileHeaderDark : profileHeaderLight;
  static Color shadow(bool isDark) =>
      isDark
          ? Colors.black.withValues(alpha: 0.35)
          : Colors.black.withValues(alpha: 0.04);
  static Color appBarBg(bool isDark) =>
      isDark ? navBarDark : Colors.white;
}

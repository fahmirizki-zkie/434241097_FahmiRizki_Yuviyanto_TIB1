import 'package:flutter/material.dart';

/// Global notifier that drives light ↔ dark mode across the entire app.
///
/// Toggle with [toggle()]; read current mode via [value].
/// Wrap [MaterialApp] with [ValueListenableBuilder] to react to changes.
class ThemeNotifier extends ValueNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light);

  bool get isDark => value == ThemeMode.dark;

  void toggle() {
    value = isDark ? ThemeMode.light : ThemeMode.dark;
  }

  void setDark(bool dark) {
    value = dark ? ThemeMode.dark : ThemeMode.light;
  }
}

/// Single global instance accessible from any widget.
final themeNotifier = ThemeNotifier();

import 'package:flutter/material.dart';

/// Convenience extension for frequently used context helpers.
extension ContextExtension on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
}

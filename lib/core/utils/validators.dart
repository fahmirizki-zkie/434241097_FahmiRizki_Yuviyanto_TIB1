/// Stateless validation helpers.
abstract final class Validators {
  static String? requiredText(String value, String fieldName) {
    if (value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }
}

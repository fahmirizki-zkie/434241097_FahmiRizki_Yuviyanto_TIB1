/// API endpoint paths.
/// Keep only relative paths here. Base URL belongs in network config.
abstract final class ApiEndpoints {
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String resetPassword = '/auth/reset-password';
  static const String tickets = '/tickets';
}

import 'dart:developer' as dev;

/// Thin logging wrapper to avoid direct logging calls in feature code.
class LoggerService {
  const LoggerService();

  void info(String message) {
    dev.log(message, name: 'INFO');
  }

  void error(String message, [Object? error, StackTrace? stackTrace]) {
    dev.log(message, name: 'ERROR', error: error, stackTrace: stackTrace);
  }
}

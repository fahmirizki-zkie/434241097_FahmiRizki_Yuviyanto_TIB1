import 'package:flutter/foundation.dart';

import '../../domain/entities/user_entity.dart';
import 'auth_state.dart';

/// UI controller for auth screens.
/// Suggested migration path: replace with Riverpod Notifier in this file.
class AuthController extends ChangeNotifier {
  AuthState _state = const AuthState();

  AuthState get state => _state;

  void selectRole(UserRole role) {
    _state = _state.copyWith(selectedRole: role);
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _state = _state.copyWith(isPasswordHidden: !_state.isPasswordHidden);
    notifyListeners();
  }
}

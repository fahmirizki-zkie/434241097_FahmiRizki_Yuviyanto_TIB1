import '../../domain/entities/user_entity.dart';

/// UI state model for auth screens.
class AuthState {
  const AuthState({
    this.selectedRole = UserRole.user,
    this.isLoading = false,
    this.isPasswordHidden = true,
  });

  final UserRole selectedRole;
  final bool isLoading;
  final bool isPasswordHidden;

  AuthState copyWith({
    UserRole? selectedRole,
    bool? isLoading,
    bool? isPasswordHidden,
  }) {
    return AuthState(
      selectedRole: selectedRole ?? this.selectedRole,
      isLoading: isLoading ?? this.isLoading,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
    );
  }
}

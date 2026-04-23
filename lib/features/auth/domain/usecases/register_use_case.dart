import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// Registers a new user account.
class RegisterUseCase {
  const RegisterUseCase(this._repository);

  final AuthRepository _repository;

  Future<void> call({
    required String username,
    required String password,
    required UserRole role,
  }) {
    return _repository.register(
      username: username,
      password: password,
      role: role,
    );
  }
}

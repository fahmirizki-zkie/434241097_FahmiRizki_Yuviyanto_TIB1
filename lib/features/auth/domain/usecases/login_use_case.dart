import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// Authenticates user credentials.
class LoginUseCase {
  const LoginUseCase(this._repository);

  final AuthRepository _repository;

  Future<UserEntity> call({
    required String username,
    required String password,
    required UserRole role,
  }) {
    return _repository.login(
      username: username,
      password: password,
      role: role,
    );
  }
}

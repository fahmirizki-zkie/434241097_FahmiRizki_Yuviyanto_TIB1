import '../entities/user_entity.dart';

/// Domain contract for auth operations.
abstract class AuthRepository {
  Future<UserEntity> login({
    required String username,
    required String password,
    required UserRole role,
  });

  Future<void> register({
    required String username,
    required String password,
    required UserRole role,
  });

  Future<void> logout();

  Future<void> resetPassword({required String username});
}

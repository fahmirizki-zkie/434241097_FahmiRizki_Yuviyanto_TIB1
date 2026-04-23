import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

/// Data-layer implementation of auth repository contract.
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._dataSource);

  final AuthRemoteDataSource _dataSource;

  @override
  Future<UserEntity> login({
    required String username,
    required String password,
    required UserRole role,
  }) async {
    final model = await _dataSource.login(
      username: username,
      password: password,
      role: role.name,
    );
    return model.toEntity();
  }

  @override
  Future<void> register({
    required String username,
    required String password,
    required UserRole role,
  }) {
    return _dataSource.register(
      username: username,
      password: password,
      role: role.name,
    );
  }

  @override
  Future<void> logout() async {
    // TODO: Clear local token/session storage.
  }

  @override
  Future<void> resetPassword({required String username}) {
    return _dataSource.resetPassword(username: username);
  }
}

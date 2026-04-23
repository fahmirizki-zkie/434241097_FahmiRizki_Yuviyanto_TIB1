import '../repositories/auth_repository.dart';

/// Triggers password reset process.
class ResetPasswordUseCase {
  const ResetPasswordUseCase(this._repository);

  final AuthRepository _repository;

  Future<void> call({required String username}) {
    return _repository.resetPassword(username: username);
  }
}

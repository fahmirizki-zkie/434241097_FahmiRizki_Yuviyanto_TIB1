import '../models/user_model.dart';

/// Auth data source contract.
abstract class AuthRemoteDataSource {
  Future<UserModel> login({
    required String username,
    required String password,
    required String role,
  });

  Future<void> register({
    required String username,
    required String password,
    required String role,
  });

  Future<void> resetPassword({required String username});
}

/// Dummy in-memory source used in UI-first phase.
/// Replace this implementation with real API integration later.
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl();

  final List<UserModel> _users = <UserModel>[
    const UserModel(id: 'u-1', username: 'user.demo', role: 'user'),
    const UserModel(id: 'a-1', username: 'admin.demo', role: 'admin'),
    const UserModel(id: 'h-1', username: 'helpdesk.demo', role: 'helpdesk'),
  ];

  final Map<String, String> _passwordByUsername = <String, String>{
    'user.demo': '12345678',
    'admin.demo': '12345678',
    'helpdesk.demo': '12345678',
  };

  @override
  Future<UserModel> login({
    required String username,
    required String password,
    required String role,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));

    final String normalizedUsername = username.trim().toLowerCase();
    final String normalizedRole = role.trim().toLowerCase();

    final UserModel user = _users.firstWhere(
      (UserModel item) =>
          item.username.toLowerCase() == normalizedUsername &&
          item.role.toLowerCase() == normalizedRole,
      orElse: () => throw StateError('User not found for selected role'),
    );

    final String? expectedPassword = _passwordByUsername[user.username];
    if (expectedPassword != password) {
      throw StateError('Invalid username or password');
    }

    return user;
  }

  @override
  Future<void> register({
    required String username,
    required String password,
    required String role,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));

    final String normalizedUsername = username.trim().toLowerCase();
    final String normalizedRole = role.trim().toLowerCase();

    final bool exists = _users.any(
      (UserModel item) => item.username.toLowerCase() == normalizedUsername,
    );
    if (exists) {
      throw StateError('Username already registered');
    }

    final UserModel newUser = UserModel(
      id: 'u-${_users.length + 1}',
      username: normalizedUsername,
      role: normalizedRole,
    );

    _users.add(newUser);
    _passwordByUsername[newUser.username] = password;
  }

  @override
  Future<void> resetPassword({required String username}) async {
    await Future<void>.delayed(const Duration(milliseconds: 150));

    final String normalizedUsername = username.trim().toLowerCase();
    final bool exists = _users.any(
      (UserModel item) => item.username.toLowerCase() == normalizedUsername,
    );
    if (!exists) {
      throw StateError('Username not found');
    }

    _passwordByUsername[normalizedUsername] = '12345678';
  }
}

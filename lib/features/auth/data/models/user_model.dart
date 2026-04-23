import '../../domain/entities/user_entity.dart';

/// DTO used for JSON serialization in auth data layer.
class UserModel {
  const UserModel({
    required this.id,
    required this.username,
    required this.role,
  });

  final String id;
  final String username;
  final String role;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      username: json['username'] as String,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': id, 'username': username, 'role': role};
  }

  UserEntity toEntity() {
    return UserEntity(id: id, username: username, role: _mapRole(role));
  }

  static UserRole _mapRole(String value) {
    switch (value.toLowerCase()) {
      case 'admin':
        return UserRole.admin;
      case 'helpdesk':
        return UserRole.helpdesk;
      default:
        return UserRole.user;
    }
  }
}

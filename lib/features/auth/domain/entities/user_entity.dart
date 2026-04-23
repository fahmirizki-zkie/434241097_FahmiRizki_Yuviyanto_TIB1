/// Pure domain user object used by auth use cases.
enum UserRole { user, admin, helpdesk }

class UserEntity {
  const UserEntity({
    required this.id,
    required this.username,
    required this.role,
  });

  final String id;
  final String username;
  final UserRole role;
}

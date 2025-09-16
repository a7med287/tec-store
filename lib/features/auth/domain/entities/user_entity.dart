class UserEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final bool isConfirmed;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isConfirmed,
  });
}

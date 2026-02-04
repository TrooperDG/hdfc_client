class AuthUser {
  final String userId;
  final String email;
  final String phone;
  final String role;

  const AuthUser({
    required this.userId,
    required this.email,
    required this.phone,
    required this.role,
  });

  /// Factory to build AuthUser from backend responseData
  factory AuthUser.fromApi(Map<String, dynamic> responseData) {
    final profile = responseData['profile'] ?? {};

    return AuthUser(
      userId: profile['user_id'] ?? '',
      email: profile['email'] ?? '',
      phone: profile['phone'] ?? '',
      role: responseData['role'] ?? '',
    );
  }
}

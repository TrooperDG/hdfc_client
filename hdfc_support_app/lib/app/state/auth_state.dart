// import '../../../shared/models/auth_user.dart';
import 'package:hdfc_support_app/shared/models/auth_user.dart';

class AuthState {
  final bool isAuthenticated;
  final AuthUser? user;
  final String token;
  final bool isLoading;
  final String? errorMessage;

  const AuthState({
    required this.isAuthenticated,
    required this.user,
    required this.token,
    required this.isLoading,
    required this.errorMessage,
  });

  /// Initial (logged-out) state
  factory AuthState.initial() {
    return const AuthState(
      isAuthenticated: false,
      user: null,
      token: '',
      isLoading: false,
      errorMessage: null,
    );
  }

  /// Helper to create modified copies
  AuthState setAuthState({
    bool? isAuthenticated,
    AuthUser? user,
    String? token,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
      token: token ?? this.token,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

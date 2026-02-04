import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_notifier.dart';
import 'auth_state.dart';
import '../../../shared/services/auth_service.dart';

/// Provides AuthService instance
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

/// Global auth state provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authService = ref.read(authServiceProvider);
  return AuthNotifier(authService);
});

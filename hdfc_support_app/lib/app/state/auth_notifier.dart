import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter/'

import 'package:hdfc_support_app/app/state/auth_state.dart';
import 'package:hdfc_support_app/shared/services/auth_service.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;

  AuthNotifier(this._authService) : super(AuthState.initial());

  Future<void> login({
    required String employeeId,
    required String password,
  }) async {
    state = state.setAuthState(isLoading: true, errorMessage: null);

    try {
      final result = await _authService.login(
        employeeId: employeeId,
        password: password,
      );

      state = state.setAuthState(
        isAuthenticated: true,
        user: result.user,
        token: result.token,
        isLoading: false,
      );
    } on AuthException catch (e) {
      state = state.setAuthState(
        isAuthenticated: false,
        isLoading: false,
        errorMessage: e.message,
      );
    } catch (_) {
      state = state.setAuthState(
        isAuthenticated: false,
        isLoading: false,
        errorMessage: 'Something went wrong',
      );
    }
  }

  void logout() {
    state = AuthState.initial();
  }
}

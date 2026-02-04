import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/auth_user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//for debugging
import 'dart:developer' as dev;

class AuthService {
  final String _baseUrl = dotenv.env['API_BASE_URL']!;

  Future<AuthLoginResult> login({
    required String employeeId,
    required String password,
  }) async {
    final url = Uri.parse('$_baseUrl/login');
    // print(url);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'employeeId': employeeId, 'password': password}),
    );

    final Map<String, dynamic> data = jsonDecode(response.body);

    // Backend-level failure
    if (data['success'] != 'true') {
      final message = data['responseData']?['errMessage'] ?? 'Login failed';
      throw AuthException(message);
    }

    final responseData = data['responseData'];

    dev.log(data.toString()); // just to check the code

    final user = AuthUser.fromApi(responseData);
    final token = responseData['accessToken'] ?? '';

    if (token.isEmpty) {
      throw AuthException('Invalid token received');
    }

    return AuthLoginResult(user: user, token: token);
  }
}

class AuthLoginResult {
  final AuthUser user;
  final String token;

  AuthLoginResult({required this.user, required this.token});
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() => message;
}

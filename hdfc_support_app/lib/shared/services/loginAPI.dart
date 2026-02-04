import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static String baseUrl =dotenv.env['API_BASE_URL']!;

  // "https://multilaminar-ruby-slumberously.ngrok-free.dev";

  static  String loginUrl = "$baseUrl/api/auth/login";

  // static  String loginUrl = "$baseUrl/auth/login";

  static Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "username": username,
          // "phone":username,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {
          "success": false,
          "status": response.statusCode,
          "message": response.body,
        };
      }
    } catch (e) {
      return {
        "success": false,
        "error": e.toString(),
      };
    }
  }
}

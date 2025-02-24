import 'package:dio/dio.dart';

class AuthAPI {
  static const String baseUrl = "https://illuminate-production.up.railway.app/api/auth/local";

  final Dio _dio = Dio();

  Future<String> login(String identifier, String password) async {
    try {
      final response = await _dio.post(baseUrl, data: {
        'identifier': identifier,
        'password': password,
      });

      if (response.statusCode == 200) {
        return response.data['jwt'];  // Returning JWT token
      }
    } catch (e) {
      rethrow;
    }
    return '';
  }
}

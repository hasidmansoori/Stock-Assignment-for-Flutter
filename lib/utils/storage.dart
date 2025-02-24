import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static final _storage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await _storage.write(key: 'jwt', value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: 'jwt');
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: 'jwt');
  }
}

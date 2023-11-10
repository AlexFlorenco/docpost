import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  final _storage = FlutterSecureStorage();

  saveToken(String token, String expires_in) async {
    await _storage.write(key: 'token', value: token);
    await _storage.write(key: 'expires_in', value: expires_in);
  }

  Future<Map<String, String>> getToken() {
    return _storage.readAll();
  }
}
